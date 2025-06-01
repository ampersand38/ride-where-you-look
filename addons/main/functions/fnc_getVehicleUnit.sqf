#include "script_component.hpp"
/*
Author: Ampersand
Get the vehicle that the unit is looking at

* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* -

* Example:
* [player] call rwyl_main_fnc_getVehicleUnit
*/

params ["_unit"];

private _currentVehicle = vehicle _unit;
private _isViV = _currentVehicle isKindOf QGVAR(viv_helper);
private _isOnFoot = _currentVehicle == _unit;

// getCursorObjectParams
getCursorObjectParams params ["_vehicle", "", "_distance"];

private _fullCrew = if (
    _distance < RWYL_HopVehicleRange
    && { !(_vehicle isKindOf QGVAR(viv_helper)) }
) then {
    [_vehicle] call FUNC(fullCrew);
} else { [] };
if (_fullCrew isNotEqualTo [] && {locked _vehicle < 2}) exitWith {[_vehicle, _fullCrew]};

private _unitPos = eyePos _unit;
private _viewDir = (positionCameraToWorld [0, 0, 0]) vectorFromTo (positionCameraToWorld [0, 0, 1]);

// nearEntities
private _entities = ((ASLToAGL _unitPos vectorAdd _viewDir) nearEntities ["AllVehicles", 1.5]) - [_currentVehicle]; // Static weapons
[[0.5, 0.5], _entities] call FUNC(nearestOnScreen) params ["_vehicle", "_fullCrew"];
if (_isOnFoot && {_fullCrew isNotEqualTo []} && {locked _vehicle < 2}) exitWith {[_vehicle, _fullCrew]};

_entities = ((ASLToAGL _unitPos vectorAdd _viewDir vectorMultiply 5) nearEntities ["AllVehicles", 7.5]) - [_currentVehicle];
[[0.5, 0.5], _entities] call FUNC(nearestOnScreen) params ["_vehicle", "_fullCrew"];
if (_isOnFoot && {_fullCrew isNotEqualTo []} && {locked _vehicle < 2}) exitWith {[_vehicle, _fullCrew]};

// lineIntersectsSurfaces
private _end = (_unitPos vectorAdd (_viewDir vectorMultiply RWYL_HopVehicleRange));
_vehicle = lineIntersectsSurfaces [_unitPos, _end, _unit, _currentVehicle]
    param [0, [nil, nil, _currentVehicle]] select 2;

if (isNull _vehicle && {!_isOnFoot}) then {
    _vehicle = _currentVehicle;
};

if (
    _isViV
    || {!isNull isVehicleCargo _vehicle}
) then {
    _vehicle = isVehicleCargo _vehicle;
};

_fullCrew = [_vehicle] call FUNC(fullCrew);
if (_fullCrew isNotEqualTo [] && {locked _vehicle < 2}) exitWith {[_vehicle, _fullCrew]};

[objNull, []]
