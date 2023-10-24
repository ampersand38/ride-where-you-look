#include "script_component.hpp"
/*
Author: Ampersand
Move unit into vehicle seat near center of view

* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* -

* Exrwylle:
* [player] call rwyl_main_fnc_moveSeat
*/

params ["_unit"];

if (isNull rwyl_main_vehicle || {GVAR(indexClosest) < 0}) exitWith {false}; // no vehicle

// Check for drag, carry, escort
if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
    private _draggedUnit = _unit getVariable ["ace_dragging_draggedObject", objNull];
    if (!isNull _draggedUnit && {_draggedUnit isKindOf "CAManBase"}) then {
        [_unit, _draggedUnit] call ace_dragging_fnc_dropObject;
        _unit = _draggedUnit;
    } else {
        private _carriedUnit = _unit getVariable ["ace_dragging_carriedObject", objNull];
        if (!isNull _carriedUnit && {_carriedUnit isKindOf "CAManBase"}) then {
            [_unit, _carriedUnit] call ace_dragging_fnc_dropObject_carry;
            _unit = _carriedUnit;
        } else {
            private _escortedUnit = _unit getVariable ["ace_captives_escortedUnit", objNull];
            if (!isNull _escortedUnit) then {
                [_unit, _escortedUnit, false] call ace_captives_fnc_doEscortCaptive;
                _unit = _escortedUnit;
            };
        };
    };
};

private _currentVehicle = vehicle _unit;
private _isSameVehicle = rwyl_main_vehicle == _currentVehicle;
// If same vehicle and selected seat is taken/locked then do nothing
if (GVAR(CANCEL) && {_isSameVehicle}) exitWith {
    rwyl_main_vehicle = objNull;
    GVAR(seats) = nil;

    false
};

// If same vehicle then enable moveToSeat actions
private _effectiveCommander = effectiveCommander _currentVehicle;
if (_isSameVehicle && {_effectiveCommander != _unit}) then {
    _currentVehicle setVariable ["rwyl_main_effectiveCommander", _effectiveCommander, true];
    ["rwyl_main_setEffectiveCommander", [_currentVehicle, _unit]] call CBA_fnc_globalEvent;
};

["rwyl_main_moveSeatLocal", [_unit, rwyl_main_vehicle, GVAR(seats) select GVAR(indexClosest)], _unit] call CBA_fnc_targetEvent;

rwyl_main_vehicle = objNull;
GVAR(seats) = nil;

true
