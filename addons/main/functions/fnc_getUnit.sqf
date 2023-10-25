#include "script_component.hpp"
/*
Author: Ampersand
Get the unit that should be moved.

* Arguments:
* -
*
* Return Value:
* 0: Unit <OBJECT>

* Exrwylle:
* [] call rwyl_main_fnc_getUnit
*/

if (!isNull curatorCamera) exitWith {
    private _unit = (curatorSelected select 0 param [0, objNull]);
    if (_unit isKindOf "CAManBase") then { _unit } else { objNull };
};

private _unit = call CBA_fnc_currentUnit;
private _currentVehicle = objectParent _unit;
if (!isNull _currentVehicle) exitWith { _unit };

// Check for drag, carry, escort
if (!isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith { _unit };
private _aceUnit = _unit getVariable ["ace_dragging_draggedObject", objNull];
if (_aceUnit isKindOf "CAManBase") exitWith { _aceUnit };
_aceUnit = _unit getVariable ["ace_dragging_carriedObject", objNull];
if (_aceUnit isKindOf "CAManBase") exitWith { _aceUnit };
_aceUnit = _unit getVariable ["ace_captives_escortedUnit", objNull];
if (_aceUnit isKindOf "CAManBase") exitWith { _aceUnit };
//[_unit, _aceUnit] call ace_dragging_fnc_dropObject;
//[_unit, _aceUnit] call ace_dragging_fnc_dropObject_carry;
//[_unit, _escortedUnit, false] call ace_captives_fnc_doEscortCaptive;

_unit
