#include "script_component.hpp"
/*
Author: Ampersand
Return the position of the right angle vertex of the proxy

* Arguments:
* 0: Vehicle <OBJECT>
* 1: ProxyLOD <ARRAY>
*
* Return Value:
* Position <ARRAY>

* Example:
* [_vehicle, _proxyLOD] call rwyl_main_fnc_getProxyPosition
*/

params [["_vehicle", objNull], ["_proxyLOD", ""]];
if (_proxyLOD isEqualTo []) exitWith { [0,0,0] };

private _firstPoint = _vehicle selectionPosition flatten [_proxyLOD, "FirstPoint"];
private _averagePoint = _vehicle selectionPosition flatten [_proxyLOD, "AveragePoint"];

if (_firstPoint distance _averagePoint > 0.85) then {
    _firstPoint vectorAdd [0, 0,
        (_averagePoint # 2 - _firstPoint # 2) * 2 / 1.333333
    ]
} else {
    _firstPoint
}
