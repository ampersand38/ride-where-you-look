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
*       0: Proxy <STRING>
*       1: Selection Position <ARRAY>
*       2: Cargo Index <NUMBER>
*       3: Turret path <ARRAY>
*       4: Is FFV <BOOLEAN>
*       5: Icon <STRING>
*       6: Seat Name <STRING>
*       7: Compartment <STRING>
*
* Example:
* [_vehicle] call rwyl_main_fnc_getSeats
*/

params ["_vehicle"];

GVAR(proxyCache) getOrDefaultCall [typeOf _vehicle, {

// Which proxy index in order of cargo index
private _vehicleCfg = configOf _vehicle;
private _seatsC = fullCrew [_vehicle, "cargo", true];
private _cargoProxyIndexes = getArray (_vehicleCfg >> "cargoProxyIndexes");
private _cargoCompartments = getArray (_vehicleCfg >> "cargoCompartments");
{
    if (_cargoProxyIndexes isNotEqualTo []) then {
        _x set [2, _foreachIndex];
        _x set [3, _cargoProxyIndexes select _foreachIndex];
    };
    _x pushBack (_cargoCompartments param [_forEachIndex, _cargoCompartments param [0, ""]]);
} forEach _seatsC;

private _seatsD = fullCrew [_vehicle, "driver", true];
_seatsD select 0 pushBack getText (_vehicleCfg >> "driverCompartments");

private _seatsG = fullCrew [_vehicle, "gunner", true] + fullCrew [_vehicle, "commander", true] + fullCrew [_vehicle, "turret", true];
{
    private _seat = _x;
    //["_unit", "_role", "_cargoIndex", "_turretPath", "isFFV", "_assignedUnit", "_positionName"]
    _seat params ["", "", "", "_turretPath", "_isFFV"];
    _turretsCfg = [_vehicle, _turretPath] call CBA_fnc_getTurret;
    _seat set [1, getText (_turretsCfg >> "proxyType")];
    _seat set [2, getNumber (_turretsCfg >> "proxyIndex")];
    _seat pushBack getText (_turretsCfg >> "gunnerCompartments");
} forEach _seatsG;

if (_seatsC isEqualTo [] && {_seatsD isEqualTo []} && {_seatsG isEqualTo []}) exitWith { [] };

{
    private _proxy = _x;
    private _parts = toLower _proxy splitString ":\.";
    if (_parts select 0 isNotEqualTo "proxy") then { continue; };
    private _role = _parts select -2;
    private _proxyIndex = parseNumber (_parts select -1);

    // Handle non-standard (lol) proxy names
    if !(_role in PROXY_TYPES) then {
        _role = {
            if (_x in _role) exitWith {
                _x
            }
        } forEach PROXY_TYPES;
    };

    switch (_role) do {
        //["_unit", "_role", "_cargoIndex", "_turretPath", "isFFV", "_assignedUnit", "_positionName"]
        case "cargo": {
            LOG_3("%1 %2 %3 %4",_role,_proxyIndex,_x,_seatIndex);
            private _seatIndex = _seatsG findIf {_x select 1 == "CPCargo" && {_proxyIndex == (_x select 2)}};
            if (_seatIndex >= 0) then { // FFV
                (_seatsG select _seatIndex) set [0, _proxy];
                (_seatsG select _seatIndex) set [5, ICON_GUNNER];
                continue;
            };
            _seatIndex = _seatsC findIf {_proxyIndex isEqualTo (_x select 3)};
            if (_seatIndex == -1) then {
                _seatIndex = _seatsC findIf {_proxyIndex isEqualTo (_x select 2) + 1};
            };
            if (_seatIndex >= 0) then {
                (_seatsC select _seatIndex) set [0, _proxy];
                (_seatsC select _seatIndex) set [5, ICON_CARGO];
            };
        };
        case "driver": {
            LOG_2("%1 %2",_role,_proxyIndex);
            (_seatsD select 0) set [0, _proxy];
            if (_vehicle isKindOf "Air") then {
                (_seatsD select 0) set [5, ICON_PILOT];
                (_seatsD select 0) set [6, "$str_a3_showcase_future_name_pilot"];
            } else {
                (_seatsD select 0) set [5, ICON_DRIVER];
            };
        };
        case "pilot": {
            LOG_2("%1 %2",_role,_proxyIndex);
            (_seatsD select 0) set [0, _proxy];
            (_seatsD select 0) set [5, ICON_PILOT];
            (_seatsD select 0) set [6, "$str_a3_showcase_future_name_pilot"];
        };
        case "commander": {
            LOG_2("%1 %2",_role,_proxyIndex);
            private _seatIndex = _seatsG findIf {(_x select 1) == "CPCommander" && {_proxyIndex == (_x select 2)}};
            if (_seatIndex < 0) then { continue; };
            (_seatsG select _seatIndex) set [0, _proxy];
            (_seatsG select _seatIndex) set [5, ICON_COMMANDER];
        };
        case "gunner": {
            LOG_2("%1 %2",_role,_proxyIndex);
            private _seatIndex = _seatsG findIf {(_x select 1) == "CPGunner" && {_proxyIndex == (_x select 2)}};
            if (_seatIndex < 0) then { continue; };
            (_seatsG select _seatIndex) set [0, _proxy];
            (_seatsG select _seatIndex) set [5, ICON_GUNNER];
        };
    };
} forEach (_vehicle selectionNames LOD_FIREGEO);

_seatsC + _seatsD + _seatsG

}, true];
