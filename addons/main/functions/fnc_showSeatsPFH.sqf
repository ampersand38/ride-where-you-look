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
* [] call rwyl_main_fnc_showSeatsPFH
*/

params ["_unit", "_pfID"];
//_args params ["_unit", "_vehicle"];

if (
    !rwyl_main_pfh_running
    // Hop vehicle target is too far
    || {GVAR(distance) > 0 && {_unit distance rwyl_main_vehicle > GVAR(distance)}}
    || {!alive _unit} || {!alive rwyl_main_vehicle}
) exitWith {
    #ifdef DEBUG_MODE_FULL
        if (!rwyl_main_pfh_running) then {
            //systemChat "PFH stopped external"
        };
        if (GVAR(distance) > 0 && {_unit distance rwyl_main_vehicle > GVAR(distance)}) then {
            //systemChat "PFH stopped distance"
        };
    #endif

    [_pfID] call CBA_fnc_removePerFrameHandler;

    CLEANUP
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

    // Did not find proxy for seat
    if (_proxyLOD isEqualTo []) then {
        _icon = if (_turretPath isEqualType 0) then {
            ICON_CARGO
        } else {
            [ICON_DRIVER, ICON_GUNNER] select (_turretPath isEqualTo [])
        };
    };

    // Compartment check disabled due to some very silly configs e.g. Apex Van Ambulance
    //if (_unitCompartment isNotEqualTo "" && {_unitCompartment isNotEqualTo _compartment}) then { continue; };

    private _continue = false;
    // Blocked
    if ((_fullCrew select _forEachIndex) call FUNC(isBlocking)) then { _continue = true; };
    // Locked
    if (!_continue && {_turretPath isEqualTo -1} && {rwyl_main_vehicle lockedCargo _cargoIndex}) then { _continue = true; };
    if (!_continue && {_turretPath isEqualTo []} && {lockedDriver rwyl_main_vehicle}) then { _continue = true; };
    if (!_continue && {_turretPath isEqualType []} && {rwyl_main_vehicle lockedTurret _turretPath}) then { _continue = true; };
    if (!_continue && {_compartment isEqualTo "viv"} && {!([rwyl_main_vehicle] call FUNC(canViV))}) then { _continue = true; };
    if (_continue) then {
        drawIcon3D [ICON_CANCEL, RWYL_OtherSeatsColour, rwyl_main_vehicle modelToWorldVisual _selectionPosition, RWYL_OtherSeatsIconSize, RWYL_OtherSeatsIconSize, 0, _seatName];
        continue;
    };

    #ifdef DEBUG_MODE_FULL
        if (_selectionPosition isEqualTo []) then {
            //systemChat str _x;
        };
    #endif
    // Check closest
    private _w2s = worldToScreen (rwyl_main_vehicle modelToWorldVisual _selectionPosition);
    if (_w2s isEqualTo [] || {abs (_w2s select 0) > 3} || {abs (_w2s select 1) > 3}) then { continue; }; // Not on screen

    private _distance = _reference distance2D _w2s;
    if (_distance < _minDistance) then {
        _minDistance = _distance;
        _indexClosest = _forEachIndex;
    };

    if (GVAR(indexClosest) == _forEachIndex) then {
        [RWYL_SelectedSeatColour, RWYL_SelectedSeatIconSize]
    } else {
        [RWYL_OtherSeatsColour, RWYL_OtherSeatsIconSize]
    } params ["_colour", "_size"];

    drawIcon3D [_icon, _colour, rwyl_main_vehicle modelToWorldVisual _selectionPosition, _size, _size, 0, _seatName];
} forEach GVAR(seats);

// no seat proxies on screen
if (_indexClosest == -1) exitWith {
//    rwyl_main_pfh_running = false;
};

GVAR(indexClosest) = _indexClosest;

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
