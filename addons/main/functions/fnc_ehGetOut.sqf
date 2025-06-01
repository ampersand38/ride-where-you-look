#include "script_component.hpp"
/*
Author: Ampersand
EH fired when unit exits the ViV helper

* Arguments:
* 0: Vehicle <OBJECT>
* 0: nil
* 0: Unit <OBJECT>
*
* Return Value:
* None

* Example:
* [_vehicle] call rwyl_main_fnc_ehGetOut
*/

//params ["_vehicle", "_role", "_unit", "_turret"];
params [["_vehicle", objNull], "", "_unit"];

if (local _vehicle) then {
    if (!isNull isVehicleCargo _vehicle) then {
        objNull setVehicleCargo _vehicle;
    };
    deleteVehicle _vehicle;
};

if (local _unit) then {
    private _currentSeat = _unit getVariable [QGVAR(currentSeat), []];
    if (_currentSeat isEqualTo []) exitWith {};
    _currentSeat params ["_parentVehicle", "_turretPath", "_cargoIndex"];
    if (_turretPath isEqualTo []) then {
        _unit moveInCargo [_parentVehicle, _cargoIndex];
    } else {
        if (_turretPath isEqualTo [-1]) then {
            _unit moveInDriver _parentVehicle;
        } else {
            _unit moveInTurret [_parentVehicle, _turretPath];
        };
    };
    if (objectParent _unit != _parentVehicle) then {
        _unit moveInAny _parentVehicle;
    };
};
