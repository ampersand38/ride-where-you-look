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

if (isNull rwyl_main_vehicle) exitWith {}; // no vehicle

if (rwyl_main_isSeatTaken || {rwyl_main_isSeatLocked}) then {
    rwyl_main_proxy = ""; // Move into other empty seat
} else {
    if (isNil "rwyl_main_proxy") then {
        private _sn = selectionNames rwyl_main_vehicle select {
            private _proxy = toLower _x;
            private _proxyIndex = _proxy select [(_proxy find ".") + 1];
            // has non-zero selection position
            !((rwyl_main_vehicle selectionPosition _proxy) isEqualTo [0,0,0]) && {
            // ends with a number after a period
            ((parseNumber _proxyIndex > 0) || {_proxyIndex isEqualTo "0"}) && {
            // contains seat role
            (("cargo" in toLower _proxy) || {("gunner" in toLower _proxy) || {("driver" in toLower _proxy) ||
            {("commander" in toLower _proxy) || {("pilot" in toLower _proxy)}}}})}}
        };

        //"no cargo proxies found in selectionNames"
        if (_sn isEqualTo []) exitWith {false};

        private _sp = _sn apply {rwyl_main_vehicle selectionPosition _x};

        private _screenPosArray = _sp apply {
            private _w2s = worldToScreen (rwyl_main_vehicle modelToWorld _x);
            if (_w2s isEqualTo []) then {
                1000
            } else {
                ([getMousePosition, [0.5,0.5]] select (isNull curatorCamera && {isNil "ace_interact_menu_openedMenuType"})) distance2D _w2s
            };
        };

        rwyl_main_proxy = _sn # (_screenPosArray findIf {_x == selectMin _screenPosArray});
    };
};

private _draggedUnit = _unit getVariable ["ace_dragging_draggedObject", objNull];
if (!isNull _draggedUnit && {_draggedUnit isKindOf "CAManBase"}) exitWith {
    systemChat "drag";
    [_unit, _draggedUnit] call ace_dragging_fnc_dropObject;
    [{
        isNull ((_this select 0) getVariable ["ace_dragging_draggedObject", objNull])
    }, {
        params ["", "_draggedUnit", "_vehicle", "_proxy"];

        ["rwyl_main_moveSeatLocal", [_draggedUnit, _vehicle, _proxy], _draggedUnit] call CBA_fnc_targetEvent;
        rwyl_main_vehicle = objNull;
        rwyl_main_proxy = nil;
        true
    }, [_unit, _draggedUnit, rwyl_main_vehicle, rwyl_main_proxy], 5] call CBA_fnc_waitUntilAndExecute;
};

private _carriedUnit = _unit getVariable ["ace_dragging_carriedObject", objNull];
if (!isNull _carriedUnit && {_carriedUnit isKindOf "CAManBase"}) exitWith {
    systemChat "carry";
    [_unit, _carriedUnit] call ace_dragging_fnc_dropObject_carry;
    [{
        isNull ((_this select 0) getVariable ["ace_dragging_carriedObject", objNull])
    }, {
        params ["", "_carriedUnit", "_vehicle", "_proxy"];

        ["rwyl_main_moveSeatLocal", [_carriedUnit, _vehicle, _proxy], _carriedUnit] call CBA_fnc_targetEvent;
        rwyl_main_vehicle = objNull;
        rwyl_main_proxy = nil;
        true
    }, [_unit, _carriedUnit, rwyl_main_vehicle, rwyl_main_proxy], 5] call CBA_fnc_waitUntilAndExecute;
};

private _escortedUnit = _unit getVariable ["ace_captives_escortedUnit", objNull];
if (!isNull _escortedUnit && {_escortedUnit isKindOf "CAManBase"}) exitWith {
    systemChat "escort";
    [_unit, _escortedUnit] call ace_dragging_fnc_dropObject_carry;
    [{
        isNull ((_this select 0) getVariable ["ace_captives_escortedUnit", objNull])
    }, {
        params ["", "_escortedUnit", "_vehicle", "_proxy"];
// If same vehicle and selected seat is taken/locked then do nothing
if (rwyl_main_proxy == "" && {rwyl_main_vehicle == vehicle _unit}) exitWith {
    rwyl_main_vehicle = objNull;
    rwyl_main_proxy = nil;

        ["rwyl_main_moveSeatLocal", [_escortedUnit, _vehicle, _proxy], _escortedUnit] call CBA_fnc_targetEvent;
        rwyl_main_vehicle = objNull;
        rwyl_main_proxy = nil;
        true
    }, [_unit, _escortedUnit, rwyl_main_vehicle, rwyl_main_proxy], 5] call CBA_fnc_waitUntilAndExecute;
};

["rwyl_main_moveSeatLocal", [_unit, rwyl_main_vehicle, rwyl_main_proxy], _unit] call CBA_fnc_targetEvent;

rwyl_main_vehicle = objNull;
rwyl_main_proxy = nil;

true
