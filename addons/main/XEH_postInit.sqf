#include "script_component.hpp"

[QGVAR(moveSeatLocal), LINKFUNC(moveSeatLocal)] call CBA_fnc_addEventHandler;
[QGVAR(setEffectiveCommander), {(_this select 0) setEffectiveCommander (_this select 1);}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

{
    [_x, {rwyl_main_pfh_running = false;}] call CBA_fnc_addPlayerEventHandler;
} forEach ["cameraView", "unit", "visibleMap"];

#include "initKeybinds.inc.sqf"
