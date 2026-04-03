#include "script_component.hpp"
/*
Author: Ampersand
Check if unit (occupant) is blocking the seat.

* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* 0: Is Unit Switchable <BOOLEAN>

* Example:
* [_unit] call rwyl_main_fnc_isBlocking
*/

params ["_unit"];

[
    // AI
    false
    ,
    // Player
    alive _unit &&
    {private _aceLock = _unit getVariable ["ace_medical_engine_lockedSeat", nil]; isNil "_aceLock"}
] select isPlayer _unit
