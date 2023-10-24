#include "script_component.hpp"
/*
Author: Ampersand
Return the list of seat proxies

* Arguments:
* 0: Vehicle <OBJECT>
*
* Return Value:
* Seats <ARRAY>

* Example:
* [_vehicle] call rwyl_main_fnc_fullCrew
*/

params ["_vehicle"];

fullCrew [_vehicle, "cargo", true] +
fullCrew [_vehicle, "driver", true] +
fullCrew [_vehicle, "gunner", true] +
fullCrew [_vehicle, "commander", true] +
fullCrew [_vehicle, "turret", true]
