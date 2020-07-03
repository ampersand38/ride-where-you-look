/*
Author: Ampers
Move player into vehicle seat near center of view

* Arguments:
* -
*
* Return Value:
* -

* Example:
* [] call rwyl_fnc_findSeat
* [player] call tft_fnc_moveToSeat
rwyl_fnc_findSeat = {call compile preprocessFileLineNumbers "fn_findSeat.sqf"};
*/

amp_rwyl_vehicle = vehicle player;
if (amp_rwyl_vehicle == player) then {
    amp_rwyl_vehicle = nearestObject [positionCameraToWorld [0,0,3], "AllVehicles"];
    //amp_rwyl_vehicle = nearestObject [ASLToAGL eyePos player vectorAdd ((positionCameraToWorld [0,0,0] vectorFromTo positionCameraToWorld [0,0,2]) ), "AllVehicles"];
};
if (isNull amp_rwyl_vehicle) exitWith {systemChat "no pfh"};
if (amp_rwyl_vehicle distance (ASLToAGL eyePos player) > 3) exitWith {
    amp_rwyl_vehicle = objNull;
    //systemChat "vehicle is too far"
};
amp_rwyl_pfh_running = true;
[{
    params ["", "_pfID"];
    amp_rwyl_proxy = nil;
    if (amp_rwyl_vehicle distance (ASLToAGL eyePos player) > 3) exitWith {
        amp_rwyl_vehicle = objNull;
        amp_rwyl_pfh_running = false;
        //systemChat "vehicle is too far";
    };
    if (!amp_rwyl_pfh_running) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };
    
    private _sn = selectionNames amp_rwyl_vehicle select {
        private _lastChar = _x select [count _x -1];
        ((parseNumber _lastChar > 0) || {_lastChar isEqualTo "0"}) && {
        ("cargo" in toLower _x) && {
        !((amp_rwyl_vehicle selectionPosition _x) isEqualTo [0,0,0])}}};

    if (_sn isEqualTo []) exitWith {
        amp_rwyl_vehicle = objNull;
        "no cargo proxies found in selectionNames"
    };

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
    
    if (isNil "amp_rwyl_proxy") exitWith {
        amp_rwyl_vehicle = objNull;
        "no cargo proxies on screen"
    };

    drawIcon3D ["\a3\3den\Data\Cfg3DEN\Object\iconCargo_ca.paa", [1,1,1,1], amp_rwyl_vehicle modelToWorld (amp_rwyl_vehicle selectionPosition amp_rwyl_proxy), 1, 1, 0, amp_rwyl_proxy select [(amp_rwyl_proxy find ".") + 1]];
}, 0] call CBA_fnc_addPerFrameHandler;
