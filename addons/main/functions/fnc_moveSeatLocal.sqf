#include "script_component.hpp"
/*
* Author: Ampersand
* Move local unit into new seat
*
* Arguments:
* 0: Unit <OBJECT>
* 1: Move Action <ARRAY>
*   1: Action Name <STRING>
*   2: Vehicle <OBJECT>
*   3: Index/Path <NUMBER|ARRAY>
* 2: Back Action <ARRAY>
*   1: Action Name <STRING>
*   2: Vehicle <OBJECT>
*   3: Index/Path <NUMBER|ARRAY>
*
* Return Value:
* -
*
*/

params ["_unit", "_moveAction", ["_backAction", []]];
_moveAction params ["_actionName", "_vehicle", ["_indexOrPath", "driver"]];

/*
if (_actionName select [0, 1] == "M") then {
    private _effectiveCommander = _vehicle;

    if (_effectiveCommander != GVAR(unit)) then {
        GVAR(currentVehicle) setVariable [QGVAR(setEffectiveCommander), _effectiveCommander, true];
        [QGVAR(setEffectiveCommander), [GVAR(currentVehicle), GVAR(unit)]] call CBA_fnc_globalEvent;
    };
};
*/

if (!local _unit) exitWith {
    [QGVAR(moveSeatLocal), _this, GVAR(unit)] call CBA_fnc_targetEvent;
};

if (_actionName == "vivcargo") exitWith {
    _this call FUNC(moveInViV);
};

if (!isPlayer _unit) then {
    unassignVehicle _unit;
    if (_indexOrPath isEqualType 0) then { _unit assignAsCargoIndex [_vehicle, _indexOrPath];  [_unit] orderGetIn true;};
    if (_indexOrPath isEqualType "") then { _unit assignAsDriver _vehicle; [_unit] orderGetIn true;};
    if (_indexOrPath isEqualType []) then { _unit assignAsTurret [_vehicle, _indexOrPath];  [_unit] orderGetIn true;};
};

private _currentVehicle = vehicle _unit;
if (_backAction isEqualTo []) exitWith {
    if ((_actionName select [0, 1]) == "M" && {_currentVehicle == _unit}) then {
        _unit moveInAny _vehicle;
    };
    _unit action _moveAction;
};

_unit enableSimulation false;
private _preserveEngineOn = _unit == driver _currentVehicle && {isEngineOn _currentVehicle};
moveOut _unit;
if (_preserveEngineOn) then {_currentVehicle engineOn true};

[{
    params ["_unit", "_moveAction"];
    _moveAction params ["", "_vehicle"];

    private _currentVehicle = vehicle _unit;
    // Move in new vehicle
    _currentVehicle == _unit
    // Change seat in current vehicle
    //|| {_vehicle == _currentVehicle && {effectiveCommander _vehicle == _unit}}
}, {
    params ["_unit", "_moveAction"];
    _moveAction params ["", "_vehicle"];

    _unit moveInAny _vehicle;
    _unit action _moveAction;
    _unit enableSimulation true;
}, _this, 1 , {
    params ["_unit", "", "_backAction"];
    _backAction params ["", "_currentVehicle"];
    _unit moveInAny _currentVehicle;
    _unit action _backAction;
}] call CBA_fnc_waitUntilAndExecute;

true
/*
// Check if unit needs to be moved out of current vehicle
if (_mustMoveOut) then {
    private ["_driverCompartments", "_isDriverIsolated", "_cargoCompartments", "_cargoCompartmentsLast", "_compartment", "_currentTurret", "_moveBackCode", "_moveBackParams"];

    _driverCompartments = (_vehicleConfig >> "driverCompartments") call BIS_fnc_getCfgData;
    // Air class by default has driverCompartments=0 and cargoCompartments[]={0}, so we have to disable them
    _isDriverIsolated = _driverCompartments isEqualTo 0 && {_vehicle isKindOf "Air"};
    TO_COMPARTMENT_STRING(_driverCompartments);

    _cargoCompartments = getArray (_vehicleConfig >> "cargoCompartments");
    {
        if !(_x isEqualType "") then {
            _cargoCompartments set [_forEachIndex, format ["Compartment%1", _x]];
        };
    } forEach _cargoCompartments;
    _cargoCompartmentsLast = count _cargoCompartments - 1;

    // find current compartment
    private _fullCrew = fullCrew [_currentVehicle, "", true];
    (
        _fullCrew select (_fullCrew findIf {_unit == _x select 0})
    ) params ["", "_role", "_cargoIndex", "_turretPath"];

    _currentTurret = _turretPath;

    switch (_role) do {
        case "driver": {
            if (_isDriverIsolated) then {
                [] breakOut "main";
            };
            _compartment = _driverCompartments;
            _moveBackCode = {MOVE_IN_CODE(moveInDriver)};
            _moveBackParams = _currentVehicle;
        };
        case "cargo": {
            private _cargoNumber = fullCrew [_vehicle, "cargo", true] findIf {_unit == _x select 0};
            _compartment = _cargoCompartments select (_cargoNumber min _cargoCompartmentsLast);
            _moveBackCode = {MOVE_IN_CODE(moveInCargo)};
            _moveBackParams = [_vehicle, _cargoIndex];
        };
        default {
            private _turretConfig = [_vehicleConfig, _turretPath] call CBA_fnc_getTurret;
            _compartment = (_turretConfig >> "gunnerCompartments") call BIS_fnc_getCfgData;
            TO_COMPARTMENT_STRING(_compartment);
            _moveBackCode = {MOVE_IN_CODE(moveInTurret)};
            _moveBackParams = [_vehicle, _turretPath];
        };
    };

    _unit enableSimulation false;

    private _preserveEngineOn = _unit == driver _vehicle && {isEngineOn _vehicle};
    moveOut _unit;
    if (_preserveEngineOn) then {_vehicle engineOn true};

    // moveIn right after moveOut doesn't work in MP for non-local vehicles, player just stays out
    // so we have to wait some time (e.g. until player is out and turret locality become vehicle locality)
    // usually it's done in the same frame for local vehicles/turrets and takes 3-7 frames for non-local, so in MP can look a little lagging
    if (IS_MOVED_OUT) exitWith {
        LOG("moved out in current frame");
        [_unit, _moveInParams] call _moveInCode;
        WAIT_IN_OR_MOVE_BACK;
    };
    [
        {params ["_vehicle", "_unit", "_currentTurret"]; IS_MOVED_OUT},
        {
            params ["", "_unit", "", "_moveInCode", "_moveInParams", "_moveBackCode", "_moveBackParams"];
            LOG_2("moved out after %1 frames",diag_frameno-GVAR(frame),call {GVAR(frame)=diag_frameno; 0});
            [_unit, _moveInParams] call _moveInCode;
            WAIT_IN_OR_MOVE_BACK;
        },
        [_vehicle, _unit, _currentTurret, _moveInCode, _moveInParams, _moveBackCode, _moveBackParams]
    ] call CBA_fnc_waitUntilAndExecute;
};


/*

    if (_vehicle == vehicle _unit) exitWith {
        if (_indexOrPath isEqualType []) then {
            if (isPlayer _unit) then {
            } else {
                _unit assignAsTurret [_vehicle, _indexOrPath];
                [_unit] orderGetIn true;
            };
            _unit action ["MoveToTurret", _vehicle, _indexOrPath];
        } else {
            if (isPlayer _unit) then {
            } else {
                unassignVehicle _unit;
                _unit assignAsCargoIndex [_vehicle, _indexOrPath];
                [_unit] orderGetIn true;
            };
            _unit action ["MoveToCargo", _vehicle, _indexOrPath];
        };
    };
    if (_mustMoveOut || {_unit distance _vehicle > RWYL_HopVehicleRange} || {speed _vehicle > 5}) then {
        if (_indexOrPath isEqualType []) then {
            if (isPlayer _unit) then {
            } else {
                unassignVehicle _unit;
                _unit assignAsTurret [_vehicle, _indexOrPath];
                [_unit] orderGetIn true;
            };
            _unit moveInTurret [_vehicle, _indexOrPath];
        } else {
            if (isPlayer _unit) then {
            } else {
                unassignVehicle _unit;
                _unit assignAsCargoIndex [_vehicle, _indexOrPath];
                [_unit] orderGetIn true;
            };
            _unit moveInCargo [_vehicle, _indexOrPath];
        };
    } else {
        if (_indexOrPath isEqualType []) then {
            if (isPlayer _unit) then {
                _unit action ["GetInTurret", _vehicle, _indexOrPath];
            } else {
                unassignVehicle _unit;
                _unit assignAsTurret [_vehicle, _indexOrPath];
                [_unit] orderGetIn true;
                _unit moveInTurret [_vehicle, _indexOrPath];
            };
        } else {
            if (isPlayer _unit) then {
                _unit action ["GetInCargo", _vehicle, _indexOrPath];
            } else {
                unassignVehicle _unit;
                _unit assignAsCargoIndex [_vehicle, _indexOrPath];
                [_unit] orderGetIn true;
                _unit moveInCargo [_vehicle, _indexOrPath];
            };
        };
    };

    // check seat type of proxy
    switch (true) do {
        // Turret
        case (_turretPath isEqualType [] && {_turretPath isNotEqualTo []}): {
            [_unit, _vehicle, _mustMoveOut, _turretPath] call _fnc_sendIntoCargoOrTurret;
        };
        // Cargo
        case (_turretPath isEqualType 0): {
            [_unit, _vehicle, _mustMoveOut, if (_cargoActionIndex == -1) then {_cargoIndex} else {_cargoActionIndex}] call _fnc_sendIntoCargoOrTurret;
        };
        // Driver
        case (_cargoIndex == -1): {
            if (_vehicle == vehicle _unit) exitWith {
                _unit action ["MoveToDriver", _vehicle];
                if (isPlayer _unit) then {
                } else {
                    unassignVehicle _unit;
                    _unit assignAsDriver _vehicle;
                    [_unit] orderGetIn true;
                };
            };
            if (_mustMoveOut || {_unit distance _vehicle > RWYL_HopVehicleRange} || {speed _vehicle > 5}) then {
                _unit moveInDriver _vehicle;
                if (isPlayer _unit) then {
                } else {
                    unassignVehicle _unit;
                    _unit assignAsDriver _vehicle;
                    [_unit] orderGetIn true;
                };
            } else {
                if (isPlayer _unit) then {
                    _unit action ["GetInPilot", _vehicle];
                } else {
                    unassignVehicle _unit;
                    _unit assignAsDriver _vehicle;
                    [_unit] orderGetIn true;
                    _unit moveInDriver _vehicle;
                };
            };
        };
        case ("commander" in toLower _proxy): {
            if (_vehicle == vehicle _unit) exitWith {
                _unit action ["MoveToCommander", _vehicle];
                if (isPlayer _unit) then {
                } else {
                    unassignVehicle _unit;
                    _unit assignAsCommander _vehicle;
                    [_unit] orderGetIn true;
                };
            };
            if (_mustMoveOut || {_unit distance _vehicle > RWYL_HopVehicleRange} || {speed _vehicle > 5}) then {
                _unit moveInCommander _vehicle;
                if (isPlayer _unit) then {
                } else {
                    unassignVehicle _unit;
                    _unit assignAsCommander _vehicle;
                    [_unit] orderGetIn true;
                };
            } else {
                if (isPlayer _unit) then {
                    _unit action ["GetInCommander", _vehicle];
                } else {
                    unassignVehicle _unit;
                    _unit assignAsCommander _vehicle;
                    [_unit] orderGetIn true;
                    _unit moveInCommander _vehicle;
                };
            };
        };
        default {
            if (!isPlayer _unit) then {
                unassignVehicle _unit;
            };
            if (_vehicle emptyPositions "cargo" >= 0) exitWith {
                _unit moveInCargo _vehicle;
            };
            if (_vehicle emptyPositions "gunner" >= 0) exitWith {
                _unit moveInGunner _vehicle;
            };
            if (_vehicle emptyPositions "commander" >= 0) exitWith {
                _unit moveInCommander _vehicle;
            };
            _unit moveInAny _vehicle;
        };
    };


*/
