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

if (rwyl_main_isSeatTaken && {_vehicle == vehicle _unit}) exitWith {false};

private _mustMoveOut = (_unit != vehicle _unit);
if (_mustMoveOut) then {moveOut _unit;};

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
            _indexOrPath = _proxyIndex - 1;

            private _turretConfig = configFile >> "CfgVehicles" >> typeOf _vehicle >> "Turrets" ;
            {
                if (_proxyIndex == (getNumber (_turretConfig >> _x >> "proxyIndex")) && {
                "CPCargo" isEqualTo (getText (_turretConfig >> _x >> "proxyType"))}) then {
                    _indexOrPath = [_forEachIndex];
                };
            } forEach (("true" configClasses _turretConfig) apply {configName _x});

            [_unit, _vehicle, _mustMoveOut, _indexOrPath] call _fnc_sendIntoCargoOrTurret;
        };
        case ("gunner" in toLower _proxy): {
            private _proxyIndex = parseNumber (_proxy select [(_proxy find ".") + 1]);

            private _turretConfig = configFile >> "CfgVehicles" >> typeOf _vehicle >> "Turrets" ;
            {
                if (_proxyIndex == (getNumber (_turretConfig >> _x >> "proxyIndex")) && {
                "CPGunner" isEqualTo (getText (_turretConfig >> _x >> "proxyType"))}) then {
                    _indexOrPath = [_forEachIndex];
                };
            } forEach (("true" configClasses _turretConfig) apply {configName _x});

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
