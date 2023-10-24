#include "script_component.hpp"

["rwyl_main_moveSeatLocal", {
    //params ["_unit", "_vehicle", "_proxy"];
    call rwyl_main_fnc_moveSeatLocal;
}] call CBA_fnc_addEventHandler;

["rwyl_main_setEffectiveCommander", {(_this select 0) setEffectiveCommander (_this select 1)}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

#include "initKeybinds.sqf"
//#include "initVehicles.sqf"
