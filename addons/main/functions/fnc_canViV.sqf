#include "script_component.hpp"
/*
Author: Ampersand
Check if vehice has ViV space for unit

* Arguments:
* 0: Vehicle <OBJECT>
*
* Return Value:
* 0: Can get in <BOOLEAN>

* Example:
* [_vehicle] call rwyl_main_fnc_canViV
*/

params ["_vehicle"];

if (isNil QGVAR(viv_helper) || {isNull GVAR(viv_helper)}) then {
    GVAR(viv_helper) = QGVAR(viv_helper) createVehicleLocal [0, 0, 1000];
};

private _canViV = (_vehicle canVehicleCargo GVAR(viv_helper)) # 0;
deleteVehicle GVAR(viv_helper);

_canViV

