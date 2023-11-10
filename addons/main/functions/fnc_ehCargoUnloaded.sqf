#include "script_component.hpp"
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

private _crew = crew _cargoVehicle;

if (_crew isEqualTo []) exitWith {
    deleteVehicle _cargoVehicle;
};

{moveOut _x} forEach crew _cargoVehicle;
