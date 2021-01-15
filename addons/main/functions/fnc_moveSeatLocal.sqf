#include "script_component.hpp"
/*
Author: Ampers
Move unit into vehicle seat near center of view

* Arguments:
* 0: Unit <OBJECT>
* 1: Vehicle <OBJECT>
* 2: Proxy <STRING>
*
* Return Value:
* -

* Exrwylle:
* [player, vehicle player, "proxy:\a3\data_f\proxies\passenger_low01\cargo.001"] call rwyl_main_fnc_moveSeatLocal
* [player, cursorObject, ""] call rwyl_main_fnc_moveSeatLocal
*/

params ["_unit", "_vehicle", "_proxy"];

#define TAKEN_SEAT_TIMEOUT 0.5

#define TO_COMPARTMENT_STRING(var) if !(var isEqualType "") then {var = format [ARR_2("Compartment%1",var)]}

// if unit isn't moved to new seat in TAKEN_SEAT_TIMEOUT, we move him back to his seat
#define WAIT_IN_OR_MOVE_BACK \
    [ARR_5( \
        {!isNull objectParent (_this select 0)}, \
        { \
            LOG_1("moved in after %1 frames",diag_frameno-GVAR(frame)); \
            (_this select 0) enableSimulation true; \
        }, \
        [ARR_3(_unit,_moveBackCode,_moveBackParams)], \
        TAKEN_SEAT_TIMEOUT, \
        { \
            params [ARR_3("_unit","_moveBackCode","_moveBackParams")]; \
            WARNING_1("failed move in after %1 frames",diag_frameno-GVAR(frame)); \
            [ARR_2(_unit,_moveBackParams)] call _moveBackCode; \
            localize "str_mis_state_failed" call ace_common_fnc_displayTextStructured; \
            _unit enableSimulation true; \
        } \
    )] call CBA_fnc_waitUntilAndExecute;

#define IS_MOVED_OUT \
( \
    isNull objectParent _unit \
    && { \
        [] isEqualTo _currentTurret \
        || {local _vehicle isEqualTo (_vehicle turretLocal _currentTurret)} \
    } \
)

#define MOVE_IN_CODE(command) (_this select 0) command (_this select 1)

if (rwyl_main_isSeatTaken && {_vehicle == vehicle _unit}) exitWith {false};

private _mustMoveOut = (_unit != vehicle _unit);
if (_mustMoveOut) then {
    private ["_driverCompartments", "_isDriverIsolated", "_cargoCompartments", "_cargoCompartmentsLast", "_compartment", "_currentTurret", "_moveBackCode", "_moveBackParams"];

    // find current compartment
    private _currentVehicle = vehicle _unit;
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

[{
    params ["_unit"];
    vehicle _unit == _unit
},{
    params ["_unit", "_vehicle", "_proxy", "_mustMoveOut", ["_indexOrPath", nil]];

    private _fnc_sendIntoCargoOrTurret = {
        params ["_unit", "_vehicle", "_mustMoveOut", ["_indexOrPath", nil]];
        if (_mustMoveOut) then {
            if (_indexOrPath isEqualType []) then {
                _unit moveInTurret [_vehicle, _indexOrPath];
                if (isPlayer _unit) then {
                } else {
                    unassignVehicle _unit;
                    _unit assignAsTurret [_vehicle, _indexOrPath];
                    [_unit] orderGetIn true;
                };
            } else {
                _unit moveInCargo [_vehicle, _indexOrPath];
                if (isPlayer _unit) then {
                } else {
                    unassignVehicle _unit;
                    _unit assignAsCargoIndex [_vehicle, _indexOrPath];
                    [_unit] orderGetIn true;
                };
            };
        } else {
            if (_indexOrPath isEqualType []) then {
                if (isPlayer _unit) then {
                    _unit action ["GetInTurret", _vehicle, _indexOrPath];
                } else {
                    unassignVehicle _unit;
                    _unit assignAsTurret [_vehicle, _indexOrPath];
                    [_unit] orderGetIn true;
                };
            } else {
                if (isPlayer _unit) then {
                    _unit action ["GetInCargo", _vehicle, _indexOrPath];
                } else {
                    unassignVehicle _unit;
                    _unit assignAsCargoIndex [_vehicle, _indexOrPath];
                    [_unit] orderGetIn true;
                };
            };
        };
    };

    // check seat type of proxy
    switch (true) do {
        case ("cargo" in toLower _proxy): {
            // get cargo index from proxy name
            private _proxyIndex = parseNumber (_proxy select [(_proxy find ".") + 1]);
            private _vehicleConfig = configOf _vehicle;
            private _cargoIndexes = _vehicle getVariable ["RWYL_cargoProxyIndexes", []];
            if (_cargoIndexes isEqualTo []) then {
                _cargoIndexes = getArray (_vehicleConfig >> "cargoProxyIndexes");
            };
            private _indexOrPath = _cargoIndexes find _proxyIndex;
            if (_indexOrPath == -1) then {
                _indexOrPath = _proxyIndex - 1;
            };
            private _turretConfig = _vehicleConfig >> "Turrets" ;
            {
                if (_proxyIndex == (getNumber (_x >> "proxyIndex")) && {
                "CPCargo" isEqualTo (getText (_x >> "proxyType"))}) then {
                    _indexOrPath = [_forEachIndex];
                };
            } forEach (("true" configClasses _turretConfig));

            [_unit, _vehicle, _mustMoveOut, _indexOrPath] call _fnc_sendIntoCargoOrTurret;
        };
        case ("gunner" in toLower _proxy): {
            private _proxyIndex = parseNumber (_proxy select [(_proxy find ".") + 1]);

            private _turretConfig = configFile >> "CfgVehicles" >> typeOf _vehicle >> "Turrets" ;
            {
                if (_proxyIndex == (getNumber (_x >> "proxyIndex")) && {
                "CPGunner" isEqualTo (getText (_x >> "proxyType"))}) then {
                    _indexOrPath = [_forEachIndex];
                };
            } forEach (("true" configClasses _turretConfig));

            [_unit, _vehicle, _mustMoveOut, _indexOrPath] call _fnc_sendIntoCargoOrTurret;
        };
        case ("driver" in toLower _proxy): {
            if (_mustMoveOut) then {
                _unit moveInDriver _vehicle;
                if (isPlayer _unit) then {
                } else {
                    unassignVehicle _unit;
                    _unit assignAsDriver _vehicle;
                    [_unit] orderGetIn true;
                };
            } else {
                if (isPlayer _unit) then {
                    _unit action ["GetInDriver", _vehicle];
                } else {
                    unassignVehicle _unit;
                    _unit assignAsDriver _vehicle;
                    [_unit] orderGetIn true;
                };
            };
        };
        case ("pilot" in toLower _proxy): {
            if (_mustMoveOut) then {
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
                };
            };
        };
        case ("commander" in toLower _proxy): {
            if (_mustMoveOut) then {
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
                };
            };
        };
        default {
            if (!isPlayer _unit) then {
                unassignVehicle _unit;
            };
            private _emptySeats = (fullCrew [_vehicle, "", true]) select {isNull (_x # 0)};
            //_x params ["_seatOccupant", "_seatRole", "_seatCargoIndex", "_seatTurretPath"];
            private _emptySeatsCargo = _emptySeats select {_x # 2 >= 0};
            if !(_emptySeatsCargo isEqualTo []) exitWith {
                _indexOrPath = (_emptySeatsCargo select (count _emptySeatsCargo - 1)) # 2;
                [_unit, _vehicle, _mustMoveOut, _indexOrPath] call _fnc_sendIntoCargoOrTurret;
            };
            private _emptySeatsTurret = _emptySeats select {!((_x # 3) isEqualTo [])};
            if !(_emptySeatsCargo isEqualTo []) exitWith {
                _indexOrPath = (_emptySeatsCargo select (count _emptySeatsCargo - 1)) # 3;
                [_unit, _vehicle, _mustMoveOut, _indexOrPath] call _fnc_sendIntoCargoOrTurret;
            };
            _unit moveInAny _vehicle;
        };
    };

    _unit enableSimulation true;
}, _this + [_mustMoveOut]] call CBA_fnc_waitUntilAndExecute;
/*
[{
    ////params ["_unit", "_vehicle"];
    if (vehicle _unit == _unit) then {
        systemChat "fallback";
        _unit moveInAny _vehicle;
    };
}, _this] call CBA_fnc_execNextFrame;
*/
true
