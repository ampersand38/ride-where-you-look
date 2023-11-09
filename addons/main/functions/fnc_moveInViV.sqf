#include "script_component.hpp"
/*
* Author: Ampersand
* Move local unit into new seat
*
* Arguments:
* 0: Unit <OBJECT>
* 1: Move Action <ARRAY>
*   1: Action Name <STRING>
*   2: Vehicle <OBJECT>
*   3: Index/Path <NUMBER|ARRAY>
* 2: Back Action <ARRAY>
*   1: Action Name <STRING>
*   2: Vehicle <OBJECT>
*   3: Index/Path <NUMBER|ARRAY>
*
* Return Value:
* -
*
*/
systemChat "viv";
params ["_unit", "_moveAction", ["_backAction", []]];
_moveAction params ["_actionName", "_vehicle", ["_indexOrPath", "driver"]];

private _viv_helper = QGVAR(viv_helper) createVehicleLocal [0, 0, 1000];
_vehicle setVehicleCargo _viv_helper;

private _currentVehicle = vehicle _unit;
if (_backAction isEqualTo []) exitWith {
    if ((_actionName select [0, 1]) == "M" && {_currentVehicle == _unit}) then {
        _unit moveInTurret [_viv_helper, [0]];
    };
};

_unit enableSimulation false;
private _preserveEngineOn = _unit == driver _currentVehicle && {isEngineOn _currentVehicle};
moveOut _unit;
if (_preserveEngineOn) then {_currentVehicle engineOn true};

[{
    params ["_unit", "_vehicle", "_viv_helper"];

    private _currentVehicle = vehicle _unit;
    // Move in new vehicle
    _currentVehicle == _unit
    // Change seat in current vehicle
    //|| {_vehicle == _currentVehicle && {effectiveCommander _vehicle == _unit}}
}, {
    params ["_unit", "_vehicle", "_viv_helper"];

    _unit moveInTurret [_viv_helper, [0]];
    _unit enableSimulation true;
}, [_unit, _vehicle, _viv_helper, _backAction], 1 , {
    params ["_unit", "", "", "_backAction"];
    _backAction params ["", "_currentVehicle"];
    _unit moveInAny _currentVehicle;
    _unit action _backAction;
}] call CBA_fnc_waitUntilAndExecute;

true
