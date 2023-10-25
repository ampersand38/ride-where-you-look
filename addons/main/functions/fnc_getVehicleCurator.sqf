#include "script_component.hpp"
/*
Author: Ampersand
Get the vehicle near the curator cursor

* Arguments:
* -
*
* Return Value:
* -

* Example:
* [] call rwyl_main_fnc_getVehicleCurator
*/

if (isNull curatorCamera) exitWith {objNull};

curatorMouseOver params ["_type", "_vehicle"];

private _fullCrew = if (_type isEqualTo "OBJECT") then {
    [_vehicle] call FUNC(fullCrew);
} else { [] };
if (_fullCrew isNotEqualTo []) exitWith {[_vehicle, _fullCrew]};

private _entities = (screenToWorld getMousePosition nearEntities ["AllVehicles", 20]);
[getMousePosition, _entities] call FUNC(nearestOnScreen) params ["_vehicle", "_fullCrew"];

if (_fullCrew isNotEqualTo []) exitWith { [_vehicle, _fullCrew] };

private _start = AGLtoASL positionCameraToWorld [0, 0, 0];
private _end = AGLtoASL screenToWorld getMousePosition;
_vehicle = lineIntersectsSurfaces [_start, _end] param [0, [nil, nil, objNull]] select 2;

_fullCrew = [_vehicle] call FUNC(fullCrew);

if (_fullCrew isNotEqualTo []) exitWith {[_vehicle, _fullCrew]};

[objNull, []]
