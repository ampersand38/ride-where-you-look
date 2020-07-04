/*
Author: Ampers
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

rwyl_main_pfh_running = false;
if (isNull rwyl_main_vehicle) then {
    rwyl_main_vehicle = vehicle _unit;
    if (rwyl_main_vehicle == _unit) then {
        rwyl_main_vehicle = nearestObject [positionCameraToWorld [0,0,2], "AllVehicles"];
    };
};

if (isNil "rwyl_main_proxy") then {
    private _sn = selectionNames rwyl_main_vehicle select {("cargo" in toLower _x) && {!((rwyl_main_vehicle selectionPosition _x) isEqualTo [0,0,0])}};

    if (_sn isEqualTo []) exitWith {    "no cargo proxies found in selectionNames"};

    private _sp = _sn apply {rwyl_main_vehicle selectionPosition _x};

    private _screenPosArray = _sp apply {
        private _w2s = worldToScreen (rwyl_main_vehicle modelToWorld _x);
        if (_w2s isEqualTo []) then {
            1000
        } else {
            [0.5,0.5] distance2D _w2s
        };
    };

    rwyl_main_proxy = _sn # (_screenPosArray findIf {_x == selectMin _screenPosArray});
};

if (rwyl_main_proxy isEqualTo "") exitWith {    ["no seat found", rwyl_main_vehicle]};

// get cargo index from proxy name
private _cargoIndexStr = rwyl_main_proxy select [(rwyl_main_proxy find ".") + 1];

// get all cargo seat indexes
private _fullCrew = fullCrew [rwyl_main_vehicle, "", true];

private _role = "";
private _cargoIndex = -1;
private _turretPath = [];

{
    //_x params ["_seatOccupant", "_seatRole", "_seatCargoIndex", "_seatTurretPath"];
    _x params ["_seatOccupant", "_seatRole", "_seatCargoIndex", "_seatTurretPath"];
    if (
        isNull _seatOccupant && {
        parseNumber _cargoIndexStr == _seatCargoIndex + 1}
    ) then {
        _cargoIndex = _seatCargoIndex;
        _role = _seatRole;
        _turretPath = _seatTurretPath;
    };
    _seatCargoIndex == _cargoIndex && {isNull _seatOccupant}
} forEach _fullCrew;

if (_cargoIndex < 0) exitWith {
["_cargoIndex not found", rwyl_main_proxy, _cargoIndexStr, _cargoIndex]
};

["rwyl_main_moveSeat", [_unit, _role, _cargoIndex, _turretPath], _unit] call CBA_fnc_targetEvent;
