#include "script_component.hpp"
/*
Author: Ampers
Return the right angle vertex of the proxy

* Arguments:
* 0: Vehicle <OBJECT>
* 1: Proxy <STRING>
*
* Return Value:
* -

* Example:
* [_vehicle, _proxy] call rwyl_main_fnc_getProxyPosition
*/

params ["_vehicle", "_proxy"];

private _averagePoint = _vehicle selectionPosition [_proxy, "FireGeometry", "AveragePoint"];
// by Leopard20
_vehicle selectionVectorDirAndUp [_proxy, "FireGeometry"] params ["_vy", "_vz"];
_averagePoint vectorAdd (_vy vectorMultiply 1/3) vectorAdd (_vz vectorMultiply -2/3)
