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
* [player] call rwyl_main_fnc_findSeat
*/

params ["_unit"];

// get vehicle
private _notInZeus = isNull curatorCamera;
private _currentVehicle = vehicle _unit;
private _isOnFoot = _currentVehicle == _unit;

private _fnc_nearestOnScreen = {
    params ["_reference", "_entities"];

    private _minDistance = 1000;
    private _indexClosest = -1;
    { // Get closest to center of screen
        if (0 < (count fullCrew [_x, "", true])) then {
            private _w2s = worldToScreen (getPos _x);
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
        private _entities = ((_unit modelToWorld [0, 1.5, 0]) nearEntities ["AllVehicles", 1.5]);
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

if (locked rwyl_main_vehicle in [2,3] && {_notInZeus}) exitWith { // locked
    rwyl_main_vehicle = objNull;
};

// hop vehicle filter for near proxies
private _hopVehicle = !_isOnFoot && {(_currentVehicle != rwyl_main_vehicle) && {_notInZeus}};
if (_hopVehicle) then {
    _sn = _sn select {
        ([rwyl_main_vehicle, _x select 0] call FUNC(getProxyPosition)) distance (rwyl_main_vehicle worldToModel getPos _unit) < RWYL_HopVehicleRange
    };
};
rwyl_main_vehicle_distance = (_unit distance rwyl_main_vehicle) + RWYL_HopVehicleRange;

GVAR(seats) = [rwyl_main_vehicle] call FUNC(getSeats);
{
    if !(_proxy isEqualType "") then { continue; };
    _x set [1, [rwyl_main_vehicle, _x select 0] call FUNC(getProxyPosition)];
} forEach GVAR(seats);

rwyl_main_pfh_running = true;
GVAR(indexClosest) = -1;
[{
    params ["_unit", "_pfID"];

    if (
        !rwyl_main_pfh_running
        || { // Hop vehicle target is too far
            rwyl_main_vehicle_distance > 0 && {_unit distance rwyl_main_vehicle > rwyl_main_vehicle_distance}
        }
    ) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
        rwyl_main_vehicle_distance = -1;
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
        _x params ["_proxy", "_selectionPosition", "_cargoIndex", "_turretPath", "_isFFV", "_icon", "_seatName", "_compartment"];
        if !(_proxy isEqualType "") then { continue; };
        // Compartment check disabled due to some very silly configs e.g. Apex Van Ambulance
        //if (_unitCompartment isNotEqualTo "" && {_unitCompartment isNotEqualTo _compartment}) then { continue; };

        // Draw
        private _continue = false;
        private _text = localize _seatName;
        if (_cargoIndex >= 0 && {_turretPath isEqualType 0}) then {
            _text = format ["%1 %2", _text, _turretPath];
            if (rwyl_main_vehicle lockedCargo _cargoIndex) then {
                LOG_2("Locked cargo %1 %2",_cargoIndex,_turretPath);
                _continue = true;
            };
        };
        if (_cargoIndex == -1 && {lockedDriver rwyl_main_vehicle}) then {
            LOG("Locked driver");
            _continue = true;
        };
        if (_cargoIndex >= 0 && {_turretPath isEqualType []} && {_turretPath isNotEqualTo []} && {rwyl_main_vehicle lockedTurret _turretPath}) then {
            LOG_2("Locked turret %1 %2",_cargoIndex,_turretPath);
            _continue = true;
        };
        if (alive ((_fullCrew select _forEachIndex) select 0)) then {
            LOG_2("Seat Taken %1 %2",_cargoIndex,_turretPath);
            _continue = true;
        };
        if (_continue) then {
            drawIcon3D [ICON_CANCELED, RWYL_OtherSeatsColour, rwyl_main_vehicle modelToWorldVisual _selectionPosition, 0.8, 0.8, 0, _text];
            continue;
        };

        // Check closest
        private _w2s = worldToScreen (rwyl_main_vehicle modelToWorldVisual _selectionPosition);
        private _distance = if (_w2s isEqualTo []) then {
            1000
        } else {
            _reference distance2D _w2s
        };
        if (_distance < _minDistance) then {
            _minDistance = _distance;
            _indexClosest = _forEachIndex;
        };

        if (GVAR(indexClosest) == _forEachIndex) then {
            [RWYL_SelectedSeatColour, 1.0]
        } else {
            [RWYL_OtherSeatsColour, 0.8]
        } params ["_colour", "_size"];

        drawIcon3D [_icon, _colour, rwyl_main_vehicle modelToWorldVisual _selectionPosition, _size, _size, 0, _text];

    } forEach GVAR(seats);

    // no seat proxies on screen
    if (_indexClosest == -1) exitWith {
        rwyl_main_vehicle = objNull;
    };

    GVAR(indexClosest) = _indexClosest;

}, 0, _unit] call CBA_fnc_addPerFrameHandler;

/*
// draw proxies
v = ([[curatorSelected # 0 # 0, [vehicle player, cursorObject] select (vehicle player == player)] select isNull curatorCamera, (get3DENSelected "" # 0 # 0)] select is3DEN);
onEachFrame {
    {
        drawIcon3D ["\a3\missions_f_oldman\Systems\UI\CenterDot\Data\centerDot_ca.paa", [1,1,1,1], v modelToWorldVisual (v selectionPosition [_x, "FireGeometry", "AveragePoint"]), 1, 1, 0, _x];
    } forEach (selectionNames v select {
        !((v selectionPosition [_x, "FireGeometry", "AveragePoint"]) isEqualTo [0,0,0])
    });
};
*/
