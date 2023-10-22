#include "script_component.hpp"
/*
Author: Ampersand
Return the list of seat proxies

* Arguments:
* 0: Vehicle <OBJECT>
*
* Return Value:
* Proxies <ARRAY>

* Example:
* [_vehicle] call rwyl_main_fnc_getSelectionNames
*/

params ["_vehicle"];

_vehicle selectionNames LOD_FIREGEO select {
    private _dot = _x find ".";
    _dot > 0
    && {
        private _proxy = toLower _x;
        private _proxyIndex = _proxy select [_dot + 1];
        // has non-zero selection position
        !(([_vehicle, _proxy] call rwyl_main_fnc_getProxyPosition) isEqualTo [0, 0, 0]) && {
        // ends with a number after a period
        ((parseNumber _proxyIndex > 0) || {_proxyIndex isEqualTo "0"}) && {
        // contains seat role
        (("cargo" in _proxy) || {("gunner" in _proxy) || {("driver" in _proxy) ||
        {("commander" in _proxy) || {("pilot" in _proxy)}}}})}}
    }
};
