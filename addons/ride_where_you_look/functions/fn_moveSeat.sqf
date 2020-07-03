/*
Author: Ampers
Move player into vehicle seat near center of view

* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* -

* Example:
* [_unit] call tft_fnc_moveToSeat
* [player] call tft_fnc_moveToSeat
tft_fnc_moveToSeat = {call compile preprocessFileLineNumbers "fn_moveToSeat.sqf"};
*/

params ["_unit"];


if (isNull amp_rwyl_vehicle) then {
    amp_rwyl_vehicle = vehicle _unit;
    if (amp_rwyl_vehicle == _unit) then {
        amp_rwyl_vehicle = nearestObject [positionCameraToWorld [0,0,2], "AllVehicles"];
    };
};

if (isNil "amp_rwyl_proxy") then {
    private _sn = selectionNames amp_rwyl_vehicle select {("cargo" in toLower _x) && {!((amp_rwyl_vehicle selectionPosition _x) isEqualTo [0,0,0])}};

    if (_sn isEqualTo []) exitWith {    "no cargo proxies found in selectionNames"};

    private _sp = _sn apply {amp_rwyl_vehicle selectionPosition _x};

    private _screenPosArray = _sp apply {
        private _w2s = worldToScreen (amp_rwyl_vehicle modelToWorld _x);
        if (_w2s isEqualTo []) then {
            1000
        } else {
            [0.5,0.5] distance2D _w2s
        };
    };

    amp_rwyl_proxy = _sn # (_screenPosArray findIf {_x == selectMin _screenPosArray});
};
systemChat str [amp_rwyl_vehicle, amp_rwyl_proxy];

if (amp_rwyl_proxy isEqualTo "") exitWith {    ["no seat found", amp_rwyl_vehicle]};

// get cargo index from proxy name
private _cargoIndexStr = amp_rwyl_proxy select [(amp_rwyl_proxy find ".") + 1];
/*
private _cargoIndexStr = "";
private _charIndex = count amp_rwyl_proxy - 1;
while {
    private _char = amp_rwyl_proxy select [_charIndex, 1];
    !(parseNumber _char == 0 && {!(_char isEqualTo "0")}) 
} do {
    _cargoIndexStr = (amp_rwyl_proxy select [_charIndex, 1]) + _cargoIndexStr;
    _charIndex = _charIndex - 1;
};
*/

// get all cargo seat indexes
private _fullCrew = fullCrew [amp_rwyl_vehicle, "", true];
//_x params ["_seatOccupant", "_seatRole", "_seatCargoIndex", "_seatTurretPath"];
private _cargoIndexes = (_fullCrew select {_x # 2 >= 0}) apply {_x # 2};

private _cargoIndex = -1;
for "_i" from 0 to (selectMax _cargoIndexes) do {
    if (parseNumber _cargoIndexStr == _i + 1) then {
        _cargoIndex = _i;
    };
};

// check if seat is open
private _isSeatOpen = !((_fullCrew select {
    //_x params ["_seatOccupant", "_seatRole", "_seatCargoIndex", "_seatTurretPath"];
    _x params ["_seatOccupant", "", "_seatCargoIndex"];
    _seatCargoIndex == _cargoIndex && {isNull _seatOccupant}
}) isEqualTo []);


if (!_isSeatOpen) exitWith {
["selected seat is not open", amp_rwyl_proxy, _cargoIndexStr, _cargoIndex, _isSeatOpen]
};
if !(_cargoIndex isEqualType 0) exitWith {
["_cargoIndex is not number", amp_rwyl_proxy, _cargoIndexStr, _cargoIndex, _isSeatOpen]
};

if (amp_rwyl_vehicle == vehicle _unit) then {moveOut _unit;};
[{
    params ["_unit", "_cargoIndex"];
    _unit moveInCargo [amp_rwyl_vehicle, _cargoIndex];
    
    amp_rwyl_vehicle = objNull;
    amp_rwyl_proxy = nil;
}, [_unit, _cargoIndex]] call CBA_fnc_execNextFrame;

[amp_rwyl_proxy, _cargoIndexStr, _cargoIndex, _isSeatOpen]

