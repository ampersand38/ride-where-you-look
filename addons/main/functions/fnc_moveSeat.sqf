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

if (isNull rwyl_main_vehicle) then {
    rwyl_main_vehicle = vehicle _unit;
    if (rwyl_main_vehicle == _unit) then {
        private _start = AGLtoASL (_unit modelToWorldVisual (_unit selectionPosition "pilot"));
        private _end = (_start vectorAdd (getCameraViewDirection _unit vectorMultiply 3));
        private _objects = lineIntersectsSurfaces [_start, _end, _unit];
        rwyl_main_vehicle = (_objects param [0, []]) param [2, objNull];
    };
};

if rwyl_main_isSeatTaken then {
    rwyl_main_proxy = "";
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

["rwyl_main_moveSeat", [_unit, rwyl_main_vehicle, rwyl_main_proxy], _unit] call CBA_fnc_targetEvent;

rwyl_main_vehicle = objNull;
rwyl_main_proxy = nil;

true
