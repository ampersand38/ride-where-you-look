#include "script_component.hpp"
/*
Author: Ampersand
Get the vehicle nearest the given screen coordinates

* Arguments:
* 0: Reference <ARRAY>
* 1: Entities <ARRAY>
*
* Return Value:
* 0: Nearest entity with crew <ARRAY> [_entity, _fullCrew]

* Example:
* [getMousePosition, _entities] call rwyl_main_fnc_nearestOnScreen
*/

params ["_reference", "_entities"];

private _minDistance = 10000;
private _indexClosest = -1;
private _return = [];

{
    if (locked _x in [2, 3]) then { continue; };
    private _fullCrew = [_x] call FUNC(fullCrew);
    if (_fullCrew isEqualTo []) then { continue; };

    private _w2s = worldToScreen (ASLToAGL getPosWorld _x);
    if (_w2s isEqualTo []) then { continue; };

    private _distance = _reference distance2D _w2s;

    if (_distance < _minDistance) then {
        _minDistance = _distance;
        _indexClosest = _forEachIndex;
    };
    _return set [_forEachIndex, _fullCrew]
} forEach _entities;

if (_indexClosest == -1) exitWith { [objNull, []] };

[_entities select _indexClosest, _return select _indexClosest]
