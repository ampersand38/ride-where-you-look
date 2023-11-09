#include "script_component.hpp"
/*
Author: Ampersand
Move unit into vehicle seat near center of view

* Arguments:
* -
*
* Return Value:
* -
*
* Exrwylle:
* [] call rwyl_main_fnc_selectSeat
*/

rwyl_main_pfh_running = false;

if (
    isNull GVAR(unit)
    || {isNull GVAR(vehicle)}
) exitWith {};

GVAR(seats) select GVAR(indexClosest) params ["_id", "_role", "_cargoIndex", "_turretPath", "_proxyIndex", "_actionIndex", "_seatName", "_proxyLOD", "_selectionPosition", "_icon", "_compartment"];

// On foot
if (isNull GVAR(currentVehicle)) exitWith {
    private _actionName = if (
        GVAR(unit) == call CBA_fnc_currentUnit
        && {isNull curatorCamera}
    ) then {
        "GetIn"
    } else {
        "MoveTo"
    };

    private _action = [_actionName + _role, GVAR(vehicle)];
    if (_turretPath isNotEqualTo []) then {
        _action pushback (if (_turretPath isEqualType []) then {_turretPath} else {_id});
    };

    [GVAR(unit), _action] call FUNC(moveSeatLocal);
};

// Same vehicle, use action MoveTo
if (GVAR(currentVehicle) == GVAR(vehicle) && {_id isNotEqualTo "viv"}) exitWith {
    private _action = ["MoveTo" + _role, GVAR(vehicle)];
    if (_turretPath isNotEqualTo []) then {
        _action pushback (if (_turretPath isEqualType []) then {_turretPath} else {_id});
    };

    [GVAR(unit), _action] call FUNC(moveSeatLocal);
};

// Change vehicles
private _action = ["MoveTo" + _role, GVAR(vehicle)];
if (_turretPath isNotEqualTo []) then {
    _action pushback (if (_turretPath isEqualType []) then {_turretPath} else {_id});
};

[GVAR(currentVehicle)] call FUNC(getSeats) select GVAR(currentSeat) params ["_id", "_role", "_cargoIndex", "_turretPath", "_proxyIndex", "_actionIndex", "_seatName", "_proxyLOD", "_selectionPosition", "_icon", "_compartment"];
private _actionReturn = ["MoveTo" + _role, GVAR(currentVehicle)];
if (_turretPath isNotEqualTo []) then {
    _actionReturn pushback (if (_turretPath isEqualType []) then {_turretPath} else {_id});
};
[GVAR(unit), _action, _actionReturn] call FUNC(moveSeatLocal);

true
