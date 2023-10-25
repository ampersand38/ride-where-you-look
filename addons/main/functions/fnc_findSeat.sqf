#include "script_component.hpp"
/*
Author: Ampersand
PFH to show which seat the unit is looking at

* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* -

* Example:
* [player] call rwyl_main_fnc_showSeats
*/

if (visibleMap) exitWith {};
params ["_unit"];

// get vehicle
private _notInZeus = isNull curatorCamera;
private _currentVehicle = vehicle _unit;
private _isOnFoot = _currentVehicle == _unit;

private _posFront = positionCameraToWorld [0, 5, 0];
private _fnc_nearestOnScreen = {
    params ["_reference", "_entities"];

    private _minDistance = 1000;
    private _indexClosest = -1;
    { // Get closest to center of screen
        if (0 < (count fullCrew [_x, "", true])) then {
            private _w2s = worldToScreen (ASLToAGL getPosWorld _x);
            private _distance = if (_w2s isEqualTo []) then {
                1000
            } else {
                _reference distance2D _w2s
            };
            if (_distance < _minDistance) then {
                _minDistance = _distance;
                _indexClosest = _forEachIndex;
            };
        };
    } forEach _entities;
    if (_indexClosest > -1) then {
        _entities # _indexClosest
    } else {
        objNull
    };
};

// check parentVehicle and nearEntities
rwyl_main_vehicle = if (_notInZeus) then {
    if (_isOnFoot) then {
        private _entities = (_posFront nearEntities ["AllVehicles", 5]);
        [[0.5,0.5], _entities] call _fnc_nearestOnScreen;
    } else {
        objNull
    }
} else {
    // In Zeus
    if (_isOnFoot) then {
        private _entities = (screenToWorld getMousePosition nearEntities ["AllVehicles", 10]) - [_unit];
        [getMousePosition, _entities] call _fnc_nearestOnScreen;
    } else {
        _currentVehicle
    };
};

// check view lineIntersectsSurfaces
if (isNull rwyl_main_vehicle) then {
    if _notInZeus then {
        private _start = AGLtoASL (_unit modelToWorldVisual (_unit selectionPosition "pilot"));
        private _end = (_start vectorAdd (getCameraViewDirection _unit vectorMultiply RWYL_HopVehicleRange));
        private _objects = lineIntersectsSurfaces [_start, _end, _unit, _currentVehicle];
        private _vehicle = (_objects param [0, []]) param [2, objNull];
        rwyl_main_vehicle = [_currentVehicle, _vehicle] select (0 < (count fullCrew [_vehicle, "", true]));
    } else {
        private _start = AGLtoASL positionCameraToWorld [0, 0, 0];
        private _end = AGLtoASL screenToWorld getMousePosition;
        private _objects = lineIntersectsSurfaces [_start, _end, _unit];
        rwyl_main_vehicle = (_objects param [0, []]) param [2, objNull];
    };
};

// exit checks
if (isNull rwyl_main_vehicle) exitWith {}; // no vehicle

if (locked rwyl_main_vehicle in [2,3] && {_notInZeus}) exitWith { rwyl_main_vehicle = objNull; }; // locked

// hop vehicle filter for near proxies
private _hopVehicle = !_isOnFoot && {(_currentVehicle != rwyl_main_vehicle) && {_notInZeus}};
if (_hopVehicle) then {
    _sn = _sn select {
        ([rwyl_main_vehicle, _x select 0] call FUNC(getProxyPosition)) distance (rwyl_main_vehicle worldToModel getPos _unit) < RWYL_HopVehicleRange
    };
};
GVAR(distance) = (_unit distance rwyl_main_vehicle) + RWYL_HopVehicleRange;

GVAR(seats) = [rwyl_main_vehicle] call FUNC(getSeats);
{
    _x set [SEAT_SELPOS, [rwyl_main_vehicle, _x select SEAT_PROXYLOD] call FUNC(getProxyPosition)];
} forEach GVAR(seats);

private _fullCrew = [rwyl_main_vehicle] call FUNC(fullCrew);
private _unitCrewIndex = _fullCrew findIf {_unit == _x select 0};
private _isUnitLocked = _notInZeus
    && {(_unitCrewIndex != -1)}
    && {
        GVAR(seats) select _unitCrewIndex params ["", "", "_cargoIndex", "_turretPath"];
        _turretPath isEqualTo [] && {lockedDriver rwyl_main_vehicle}
        || {(_turretPath isEqualType []) && {rwyl_main_vehicle lockedTurret _turretPath}}
        || {(_turretPath isEqualType 0) && {rwyl_main_vehicle lockedCargo _cargoIndex}}
    };
if (_isUnitLocked) exitWith { rwyl_main_vehicle = objNull; };

rwyl_main_pfh_running = true;
GVAR(indexClosest) = -1;
[{
    params ["_unit", "_pfID"];

    if (
        !rwyl_main_pfh_running
        // Hop vehicle target is too far
        || {GVAR(distance) > 0 && {_unit distance rwyl_main_vehicle > GVAR(distance)}}
        || {!alive _unit} || {!alive rwyl_main_vehicle}
    ) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
        GVAR(distance) = -1;
    };

    private _reference = if (
        isNull curatorCamera && {
        isNil "ace_interact_menu_openedMenuType" || {ace_interact_menu_openedMenuType < 0}}
    ) then {
        [0.5,0.5]
    } else {
        getMousePosition
    };

    private _fullCrew = [rwyl_main_vehicle] call FUNC(fullCrew);
    //private _unitCrewIndex = _fullCrew findIf {_unit == _x select 0};
    //private _unitCompartment = if (_unitCrewIndex != -1) then { GVAR(seats) select _unitCrewIndex select 7 } else { "" };
    private _minDistance = 10000;
    private _indexClosest = -1;
    {
        _x params ["_id", "_role", "_cargoIndex", "_turretPath", "_proxyIndex", "_actionIndex", "_seatName", "_proxyLOD", "_selectionPosition", "_icon", "_compartment"];

        // Intentionally hidden
        if (_proxyLOD isEqualTo false) then { continue; };
        // Did not find proxy for seat
        if (_proxyLOD isEqualTo []) then {
            _icon = if (_turretPath isEqualType 0) then {
                ICON_CARGO
            } else {
                if (_turretPath isEqualTo []) then { ICON_DRIVER } else { ICON_GUNNER }
            };
        };

        // Compartment check disabled due to some very silly configs e.g. Apex Van Ambulance
        //if (_unitCompartment isNotEqualTo "" && {_unitCompartment isNotEqualTo _compartment}) then { continue; };

        private _continue = false;
        // Blocked
        if (alive ((_fullCrew select _forEachIndex) select 0)) then { _continue = true; };
        // Locked
        if (!_continue && {_turretPath isEqualTo -1} && {rwyl_main_vehicle lockedCargo _cargoIndex}) then { _continue = true; };
        if (!_continue && {_turretPath isEqualTo []} && {lockedDriver rwyl_main_vehicle}) then { _continue = true; };
        if (!_continue && {_turretPath isEqualType []} && {rwyl_main_vehicle lockedTurret _turretPath}) then { _continue = true; };
        if (_continue) then {
            drawIcon3D [ICON_CANCEL, RWYL_OtherSeatsColour, rwyl_main_vehicle modelToWorldVisual _selectionPosition, RWYL_OtherSeatsIconSize, RWYL_OtherSeatsIconSize, 0, _seatName];
            continue;
        };

        // Check closest
        private _w2s = worldToScreen (rwyl_main_vehicle modelToWorldVisual _selectionPosition);
        if (_w2s isEqualTo []) then { continue; }; // Not on screen
        private _distance = _reference distance2D _w2s;
        if (_distance < _minDistance) then {
            _minDistance = _distance;
            _indexClosest = _forEachIndex;
        };

        if (GVAR(indexClosest) == _forEachIndex) then {
            GVAR(selectedSeat) = [rwyl_main_vehicle, _role, _indexOrPath];
            [RWYL_SelectedSeatColour, RWYL_SelectedSeatIconSize]
        } else {
            [RWYL_OtherSeatsColour, RWYL_OtherSeatsIconSize]
        } params ["_colour", "_size"];

        drawIcon3D [_icon, _colour, rwyl_main_vehicle modelToWorldVisual _selectionPosition, _size, _size, 0, _seatName];

    } forEach GVAR(seats);

    // no seat proxies on screen
    if (_indexClosest == -1) exitWith {
        rwyl_main_vehicle = objNull;
    };

    GVAR(indexClosest) = _indexClosest;

}, 0, _unit] call CBA_fnc_addPerFrameHandler;

/*
// Draw proxies
v = ([[curatorSelected # 0 # 0, [vehicle player, cursorObject] select (vehicle player == player)] select isNull curatorCamera, (get3DENSelected "" # 0 # 0)] select is3DEN);
onEachFrame {
    {
        drawIcon3D ["\a3\missions_f_oldman\Systems\UI\CenterDot\Data\centerDot_ca.paa", [1,1,1,1], v modelToWorldVisual (v selectionPosition [_x, "FireGeometry", "AveragePoint"]), 1, 1, 0, _x];
    } forEach (selectionNames v select {
        !((v selectionPosition [_x, "FireGeometry", "AveragePoint"]) isEqualTo [0,0,0])
    });
};

// Vehicle info
rwyl_main_proxyCache = createHashMap;
_v = call amp_fnc_gv;
_r = [];
_r = _r + [_v] call rwyl_main_fnc_fullCrew;
_r = _r + ((_v selectionNames "firegeometry") select {"proxy" in _x});
_r = _r + ([_v] call rwyl_main_fnc_getSeats);

copyToClipboard (_r joinString endl);
_r;

// Move player
_v = call amp_fnc_gv;
_index = 10;
if (objectParent player == _v) then {
player action ["moveToCargo", _v, _index];
} else {
player moveInCargo [_v, _index];
}
*/
