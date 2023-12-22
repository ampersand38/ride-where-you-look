#include "script_component.hpp"
/*
Author: Ampersand
Move unit into vehicle seat near center of view

* Arguments:
* -
*
* Back
 Value:
* -
*
* Exrwylle:
* [] call rwyl_main_fnc_selectSeat
*/

rwyl_main_pfh_running = false;

if (
    isNull GVAR(unit)
    || {isNull GVAR(vehicle)}
    || {GVAR(indexClosest) == -1}
) exitWith {};

GVAR(seats) select GVAR(indexClosest) params ["_id", "_role", "_cargoIndex", "_turretPath", "_proxyIndex", "_actionIndex", "_seatName", "", "", "", "_compartment"];

private _actionName = "MoveTo";

// On foot
if (isNull GVAR(currentVehicle)) exitWith {
    if (
        GVAR(unit) == call CBA_fnc_currentUnit
        && {isNull curatorCamera}
    ) then {
        _actionName = "GetIn";
    };
    if (_compartment == "viv") then {
        _actionName = "viv"
    };

    private _action = [_actionName + _role, GVAR(vehicle)];
    if (_turretPath isNotEqualTo []) then {
        _action pushback (if (_turretPath isEqualType []) then {_turretPath} else {_id});
    };

    [GVAR(unit), _action] call FUNC(moveSeatLocal);
};

if (_compartment == "viv") then {
    _actionName = "viv"
};

[GVAR(currentVehicle)] call FUNC(getSeats) select GVAR(currentSeat) params ["_idBack", "_roleBack", "_cargoIndexBack", "_turretPathBack", "_proxyIndexBack", "_actionIndexBack", "_seatNameBack", "", "", "", "_compartmentBack"];

// Same vehicle, use action MoveTo
if (
    GVAR(currentVehicle) == GVAR(vehicle)
    && {_compartment isNotEqualTo "viv"}
    && {_compartmentBack isNotEqualTo "viv"}
) exitWith {
    private _action = [_actionName + _role, GVAR(vehicle)];
    if (_turretPath isNotEqualTo []) then {
        _action pushback (if (_turretPath isEqualType []) then {_turretPath} else {_id});
    };
    [GVAR(unit), _action] call FUNC(moveSeatLocal);
};

// Change vehicles
private _action = [_actionName + _role, GVAR(vehicle)];
if (_turretPath isNotEqualTo []) then {
    _action pushback (if (_turretPath isEqualType []) then {_turretPath} else {_id});
};

if (_compartmentBack == "viv") then {
    _actionNameBack = "viv"
};

private _actionBack = [_actionNameBack + _role, GVAR(currentVehicle)];
if (_turretPath isNotEqualTo []) then {
    _actionBack pushback (if (_turretPath isEqualType []) then {_turretPath} else {_id});
};
[GVAR(unit), _action, _actionBack] call FUNC(moveSeatLocal);

true
