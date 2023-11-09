/*
Author: Ampersand
EH fired when the ViV helper is unloaded.

* Arguments:
* 0: Parent Vehicle <OBJECT>
* 1: Cargo Vehicle <OBJECT>
*
* Return Value:
* None

* Example:
* [_parentVehicle, _cargoVehicle] call ssl_main_fnc_ehCargoUnloaded
*/

params ["", "_cargoVehicle"];

if (
    !local _cargoVehicle
    || { !(_cargoVehicle isKindOf QGVAR(viv_helper)) }
) exitWith {};

{moveOut _x} forEach crew _cargoVehicle;
