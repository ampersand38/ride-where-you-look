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
* FFV Helper <OBJECT>
*
* rwyl_main_fnc_ffv
*
(curatorSelected # 0) apply {
    [_x] call compile preprocessFileLineNumbers "z\rwyl\addons\main\functions\fnc_ffv.sqf";
};
*/

params ["_unit"];

if !(_unit isKindOf "CAManBase") exitWith {};

private _vehicle = vehicle _unit;
if (_vehicle isKindOf QGVAR(viv_helper)) exitWith {};

if !(local _unit) exitWith {
    [QGVAR(ffv), [_unit], _unit] call CBA_fnc_targetEvent;
};

private _currentSeat = [_vehicle, _vehicle unitTurret _unit, _vehicle getCargoIndex _unit];
_unit setVariable [QGVAR(currentSeat), _currentSeat, true];
private _seatInfo = [_vehicle] call FUNC(getSeats);
private _proxyLOD = {
    _x params ["_id", "_role", "_cargoIndex", "_turretPath", "_proxyIndex", "_actionIndex", "_seatName", "_proxyLOD", "_selectionPosition", "_icon", "_compartment"];
    if (
        _turretPath isEqualTo (_vehicle unitTurret _unit) ||
        {_cargoIndex == (_vehicle getCargoIndex _unit)}
    ) exitWith {
        _proxyLOD
    };
} forEachReversed _seatInfo;
private _proxyPos = _vehicle selectionPosition _proxyLOD;

//private _proxyPos = _vehicle worldToModel ASLToAGL getPosASL _unit;

private _ffvType = [_unit] call FUNC(getFFVType);
private _ffv_helper = _ffvType createVehicle [0, 0, 1000];
private _unitDirWorld = _unit vectorModelToWorld [0, 1, 0];
private _unitDirVehicle = _vehicle vectorWorldToModel _unitDirWorld;
_ffv_helper attachTo [_vehicle, _proxyPos];
_ffv_helper setVectorDirAndUp [_unitDirVehicle, [0,0,1]];

_unit enableSimulation false;
private _preserveEngineOn = _unit == driver _vehicle && {isEngineOn _vehicle};
moveOut _unit;
if (_preserveEngineOn) then {_vehicle engineOn true};


[{
    //params ["_unit", "_vehicle", "_ffv_helper"];
    params ["_unit"];
    isNull objectParent _unit;
}, {
    params ["_unit", "_vehicle", "_ffv_helper"];

    _unit moveInAny _ffv_helper;
    _unit enableSimulation true;
}, [_unit, _vehicle, _ffv_helper, _backAction], 1 , {
    params ["_unit", "", "", "_backAction"];
    _backAction params ["", "_vehicle"];
    _unit moveInAny _vehicle;
    _unit action _backAction;
}] call CBA_fnc_waitUntilAndExecute;

_ffv_helper
