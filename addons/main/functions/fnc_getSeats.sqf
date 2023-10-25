#include "script_component.hpp"
/*
Author: Ampersand
Return the list of seat proxies

* Arguments:
* 0: Vehicle <OBJECT>
*
* Return Value:
* 0: Seats <ARRAY>
*   Seat: <ARRAY>
*       0: ID <STRING>
*       1: Role <STRING>
*       2: Cargo Index <NUMBER>
*       3: Turret path, Proxy Index <ARRAY|NUMBER>
*       4: Proxy Index <ARRAY>
*       5: Cargo Action Indexes <NUMBER> _v action ["MoveToCargo", _i]
*       6: Seat Name <STRING>
*       7: ProxyLOD <ARRAY>
*       8: Selection Position <ARRAY>
*       9: Icon <STRING>
*       10: Compartment <STRING>
*
* Example:
* [_vehicle] call rwyl_main_fnc_getSeats
*/

params ["_vehicle"];

GVAR(proxyCache) getOrDefaultCall [typeOf _vehicle, {
    private _vehicleCfg = configOf _vehicle;

    // Cargo
    private _seatsC = fullCrew [_vehicle, "cargo", true];
    private _cargoActionIndexes = _vehicle getVariable ["RWYL_cargoActionIndexes", []];
    private _cargoIndexes = _vehicle getVariable ["RWYL_cargoIndexes", []];
    private _cargoProxyIndexes = _vehicle getVariable ["RWYL_cargoProxyIndexes", getArray (_vehicleCfg >> "cargoProxyIndexes")];
    private _cargoCompartments = getArray (_vehicleCfg >> "cargoCompartments");
    {
        // Cargo Index for MoveInCargo, lockedCargo
        // Proxy Index for matching to proxies
        // Action Index for swithcing seats
        _x set [SEAT_ACTIONINDEX, _cargoActionIndexes param [_foreachIndex, -1]];
        _x set [SEAT_TURRETPATH, -1];
        _x set [SEAT_COMPARTMENT, _cargoCompartments param [_forEachIndex, _cargoCompartments param [0, ""]]];
        if (count _cargoProxyIndexes != count _seatsC) then { continue; };
        _x set [SEAT_PROXYINDEX, _cargoProxyIndexes param [_foreachIndex, _foreachIndex]];
    } forEach _seatsC;

    // Driver
    private _seatsD = fullCrew [_vehicle, "driver", true];
    if (getNumber (_vehicleCfg >> "hasDriver") == 1) then {
        _seatsD select 0 set [SEAT_COMPARTMENT, getText (_vehicleCfg >> "driverCompartments")];
    } else {
        _seatsD select 0 set [0, false]; // Skip for static weapons that include a driver in fullCrew
    };

    // Turrets
    private _seatsG = fullCrew [_vehicle, "gunner", true] + fullCrew [_vehicle, "commander", true] + fullCrew [_vehicle, "turret", true];
    {
        private _seat = _x;
        //["_unit", "_role", "_cargoIndex", "_turretPath", "isFFV", "_assignedUnit", "_positionName"]
        _seat params ["", "", "", "_turretPath", "_isFFV"];
        _turretsCfg = [_vehicle, _turretPath] call CBA_fnc_getTurret;
        _seat set [SEAT_ROLE, "turret"];
        _seat set [SEAT_PROXYINDEX, getNumber (_turretsCfg >> "proxyIndex")];
        _seat set [SEAT_ACTIONINDEX, getText (_turretsCfg >> "proxyType")];
        _seat set [SEAT_COMPARTMENT, getText (_turretsCfg >> "gunnerCompartments")];
    } forEach _seatsG;

    if (_seatsC isEqualTo [] && {_seatsD isEqualTo []} && {_seatsG isEqualTo []}) exitWith { [] };

    private _seats = _seatsC + _seatsD + _seatsG;
    {
        _x set [SEAT_ID, _foreachIndex];
        _x set [SEAT_PROXYLOD, []];
        // Localize position name for PFH
        _seatName = _x select SEAT_NAME;
        if (_seatName select [0, 1] != "$") then { continue; };
        _seatName = localize _seatName;
        _x set [SEAT_NAME, _seatName];
    } forEach _seats;

    private _mappedProxies = [];
    {
        _x params ["_lod"];
        {
            private _proxy = _x;
            if (_mappedProxies pushBackUnique _proxy == -1) then { continue; };

            private _parts = _proxy splitString ":\.";
            if (_parts select 0 isNotEqualTo "proxy") then { continue; };
            private _role = _parts select -2;
            private _proxyIndex = parseNumber (_parts select -1);

            // Handle non-standard (lol) proxy names
            if !(_role in PROXY_ROLES) then {
                _role = {
                    if (_x in _role) exitWith { _x }
                } forEach PROXY_ROLES;
            };

            switch (_role) do {
                case "cargo": {
                    // FFV
                    private _seatID = _seatsG findIf {
                        (_x select SEAT_PROXYLOD) isEqualTo []
                        && {_x select SEAT_ACTIONINDEX == "CPCargo"}
                        && {_x select SEAT_PROXYINDEX == _proxyIndex}
                    };
                    if (_seatID >= 0) then {
                        (_seatsG select _seatID) set [SEAT_PROXYLOD, [_proxy, _lod]];
                        (_seatsG select _seatID) set [SEAT_ICON, ICON_GUNNER];
                        continue;
                    };
                    // Cargo
                    _seatID = _seatsC findIf {
                        (_x select SEAT_PROXYLOD) isEqualTo []
                        && {_x select SEAT_PROXYINDEX == _proxyIndex}
                    };
                    if (_seatID == -1) then {
                        _seatID = _seatsC findIf {
                            (_x select SEAT_PROXYLOD) isEqualTo []
                            && {(_x select SEAT_PROXYINDEX) == _proxyIndex}
                        };
                    };
                    if (_seatID == -1) then { continue; };
                    private _seat = _seatsC select _seatID;
                    _seat set [SEAT_PROXYLOD, [_proxy, _lod]];
                    _seat set [SEAT_ICON, ICON_CARGO];
                    _seat set [SEAT_NAME, format ["%1 %2", _seat select SEAT_NAME, _proxyIndex]];
                };
                case "driver": {
                    (_seatsD select 0) set [SEAT_PROXYLOD, [_proxy, _lod]];
                    if (_vehicle isKindOf "Air") then {
                        (_seatsD select 0) set [SEAT_ICON, ICON_PILOT];
                        (_seatsD select 0) set [SEAT_NAME, localize "$str_a3_showcase_future_name_pilot"];
                    } else {
                        (_seatsD select 0) set [SEAT_ICON, ICON_DRIVER];
                    };
                };
                case "pilot": {
                    (_seatsD select 0) set [SEAT_PROXYLOD, [_proxy, _lod]];
                    (_seatsD select 0) set [SEAT_ICON, ICON_PILOT];
                    (_seatsD select 0) set [SEAT_NAME, localize "$str_a3_showcase_future_name_pilot"];
                };
                case "commander": {
                    private _seatID = _seatsG findIf {
                        (_x select SEAT_PROXYLOD) isEqualTo []
                        && {(_x select SEAT_ACTIONINDEX) == "CPCommander"}
                        && {_x select SEAT_PROXYINDEX == _proxyIndex}
                    };
                    if (_seatID < 0) then { continue; };
                    (_seatsG select _seatID) set [SEAT_PROXYLOD, [_proxy, _lod]];
                    (_seatsG select _seatID) set [SEAT_ICON, ICON_COMMANDER];
                };
                case "gunner": {
                    private _seatID = _seatsG findIf {
                        (_x select SEAT_PROXYLOD) isEqualTo []
                        && {(_x select SEAT_ACTIONINDEX) == "CPGunner"}
                        && {_x select SEAT_PROXYINDEX == _proxyIndex}
                    };
                    if (_seatID < 0) then { continue; };
                    (_seatsG select _seatID) set [SEAT_PROXYLOD, [_proxy, _lod]];
                    (_seatsG select _seatID) set [SEAT_ICON, ICON_GUNNER];
                };
                default { continue; };
            };
        } forEach (_vehicle selectionNames _lod);

        if ((_seats findIf {(_x select SEAT_PROXYLOD) isEqualTo []}) == -1) exitWith { LOG("Done with proxies"); };
    } forEachReversed allLODs _vehicle;

    _seats

}, true];
