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

if !(RWYL_FFVAnywhere_enable || {isNull curatorCamera}) exitWith { false };

#include "exitIfTyping.inc.sqf"

(curatorSelected # 0) apply {
    [_x] call FUNC(ffv);
};

false
