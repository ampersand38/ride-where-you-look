#include "script_component.hpp"
/*
* Author: Ampersand
* Handle input rwyl_main_key_ffv
*
* Arguments:
*
* Return Value:
*
*/

if !(RWYL_FFVAnywhere_enable) exitWith { false };

#include "exitIfTyping.inc.sqf"

if !(isNull curatorCamera) exitWith { false };

private _unit = call CBA_fnc_currentUnit;

if (isNull objectParent _unit) exitWith { false };

[_unit] call FUNC(ffv);

false
