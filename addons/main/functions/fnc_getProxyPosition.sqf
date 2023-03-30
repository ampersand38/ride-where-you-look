#include "script_component.hpp"
/*
Author: Ampers
Return the position of the right angle vertex of the proxy

* Arguments:
* 0: Vehicle <OBJECT>
* 1: Proxy <STRING>
*
* Return Value:
* Position <ARRAY>

* Example:
* [_vehicle, _proxy] call rwyl_main_fnc_getProxyPosition
*/

params ["_vehicle", "_proxy"];

private _firstPoint = _vehicle selectionPosition [_proxy, LOD_FIREGEO, "FirstPoint"];
private _averagePoint = _vehicle selectionPosition [_proxy, LOD_FIREGEO, "AveragePoint"];

if (_firstPoint distance _averagePoint > 0.85) then {
    _firstPoint vectorAdd [0, 0,
        (_averagePoint # 2 - _firstPoint # 2) * 2 / 1.333333
    ]
} else {
    _firstPoint
}
