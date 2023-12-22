#include "script_component.hpp"
/*
Author: Ampersand
Check if unit (occupant) is blocking the seat.

* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* 0: Is Unit Switchable <BOOLEAN>

* Exrwylle:
* [_unit] call rwyl_main_fnc_isBlocking
*/

params ["_unit"];

alive _unit
&& {lifeState _unit != "INCAPACITATED"}
&& { // Player can switch place with AI
    isPlayer _unit
    /*
    || {  // under their command
        group _unit != group focusOn
        || {focusOn != leader group focusOn}
    }
    */
}
