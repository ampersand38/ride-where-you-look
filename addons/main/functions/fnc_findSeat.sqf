/*
Author: Ampers
PFH to show which seat the unit is looking at

* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* -

* Exrwylle:
* [player] call rwyl_main_fnc_findSeat
*/

params ["_unit"];

private _currentVehicle = vehicle _unit;
private _isOnFoot = _currentVehicle == _unit;

if (isNull curatorCamera) then {
    setMousePosition [0.5, 0.5];
    private _start = AGLtoASL (_unit modelToWorldVisual (_unit selectionPosition "pilot"));
    private _end = (_start vectorAdd (getCameraViewDirection _unit vectorMultiply 3));
    private _objects = lineIntersectsSurfaces [_start, _end, _unit, _currentVehicle];
    rwyl_main_vehicle = (_objects param [0, []]) param [2, objNull];
    if (isNull rwyl_main_vehicle && {!_isOnFoot}) then {
        rwyl_main_vehicle = _currentVehicle;
    } else {
        if (locked rwyl_main_vehicle in [2,3]) exitWith {
            hintSilent "Vehicle Locked";
            rwyl_main_vehicle = objNull;
        };
    };
} else {
    private _start = AGLtoASL positionCameraToWorld [0,0,0];
    private _end = AGLtoASL screenToWorld getMousePosition;
    private _objects = lineIntersectsSurfaces [_start, _end, _unit];
    rwyl_main_vehicle = (_objects param [0, []]) param [2, objNull];
    if (isNull rwyl_main_vehicle && {_currentVehicle != _unit}) then {
        rwyl_main_vehicle = _currentVehicle;
    };
};

if (isNull rwyl_main_vehicle) exitWith {"no pfh"};
if ((fullCrew [rwyl_main_vehicle, "", true]) isEqualTo []) exitWith {"no seats"};

private _sn = selectionNames rwyl_main_vehicle select {
    private _proxy = toLower _x;
    private _proxyIndex = _proxy select [(_proxy find ".") + 1];
    // has non-zero selection position
    !((rwyl_main_vehicle selectionPosition _proxy) isEqualTo [0,0,0]) && {
    // ends with a number after a period
    ((parseNumber _proxyIndex > 0) || {_proxyIndex isEqualTo "0"}) && {
    // contains seat role
    (("cargo" in toLower _proxy) || {("gunner" in toLower _proxy) || {("driver" in toLower _proxy) ||
    {("commander" in toLower _proxy) || {("pilot" in toLower _proxy)}}}})} && {
    // either on foot, same vehicle, or close enough on other vehicle
    (_currentVehicle == _unit) || {(_currentVehicle == rwyl_main_vehicle) || {(!isNull curatorCamera) || {
    (_currentVehicle != rwyl_main_vehicle) && {(rwyl_main_vehicle selectionPosition _proxy) distance (rwyl_main_vehicle worldToModel getPos _unit) < 3}}}}
    }}
};

if (_sn isEqualTo []) exitWith {
    rwyl_main_vehicle = objNull;
    "no seat proxies found in selectionNames"
};

_sn = _sn - getArray (configFile >> "CfgVehicles" >> typeOf rwyl_main_vehicle >> "RWYL_proxyBlacklist");

private _sp = _sn apply {rwyl_main_vehicle selectionPosition _x};

rwyl_main_pfh_running = true;
[{
    params ["_args", "_pfID"];
    _args params ["_unit", "_sn", "_sp"];
    rwyl_main_proxy = nil;
    if (!rwyl_main_pfh_running) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };

    private _screenPosArray = _sp apply {
        private _w2s = worldToScreen (rwyl_main_vehicle modelToWorld _x);
        if (_w2s isEqualTo []) then {
            1000
        } else {
            ([getMousePosition, [0.5,0.5]] select (isNull curatorCamera && {isNil "ace_interact_menu_openedMenuType"})) distance2D _w2s
        };
    };

    rwyl_main_proxy = toLower (_sn # (_screenPosArray findIf {_x == selectMin _screenPosArray}));

    if (isNil "rwyl_main_proxy") exitWith {
        rwyl_main_vehicle = objNull;
        "no seat proxies on screen"
    };

    private _fullCrew = fullCrew [rwyl_main_vehicle, "", true];
    //_x params ["_seatOccupant", "_seatRole", "_seatCargoIndex", "_seatTurretPath"];

    // get cargo index from proxy name
    private _cargoIndex = parseNumber (rwyl_main_proxy select [(rwyl_main_proxy find ".") + 1]);

    //private _icon = "\a3\3den\Data\Cfg3DEN\Object\iconCargo_ca.paa";
    private _icon = "";

    private _text = "";
    //private _text = _cargoIndexStr;
    //private _text = rwyl_main_proxy select [(rwyl_main_proxy find ".") + 1];

    // check seat type of proxy
    switch (true) do {
        case ("cargo" in rwyl_main_proxy): {
            private _indexOrPath = _cargoIndex - 1;

            private _turretConfig = configFile >> "CfgVehicles" >> typeOf rwyl_main_vehicle >> "Turrets";
            {
                if (_cargoIndex == (getNumber (_turretConfig >> _x >> "proxyIndex")) && {
                "CPCargo" isEqualTo (getText (_turretConfig >> _x >> "proxyType"))}) then {
                    _indexOrPath = [_forEachIndex];
                };
            } forEach (("true" configClasses (_turretConfig)) apply {configName _x});

            if (_indexOrPath isEqualType []) then {
                _text = "FFV " + str _cargoIndex;
                _icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa";
                rwyl_main_isSeatTaken = alive ((_fullCrew select {(_x # 3) isEqualTo _indexOrPath}) # 0 # 0);
            } else {
                _text = "Cargo " + str _cargoIndex;
                _icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getincargo_ca.paa";
                rwyl_main_isSeatTaken = alive ((_fullCrew select {(_x # 2) == _indexOrPath}) # 0 # 0);
            };

        };
        case ("gunner" in rwyl_main_proxy): {
            private _indexOrPath = [];
            private _turretConfig = configFile >> "CfgVehicles" >> typeOf rwyl_main_vehicle >> "Turrets";
            {
                if (_cargoIndex == (getNumber (_turretConfig >> _x >> "proxyIndex")) && {
                "CPGunner" isEqualTo (getText (_turretConfig >> _x >> "proxyType"))}) then {
                    _text = getText (_turretConfig >> _x >> "gunnerName");
                    _indexOrPath = [_forEachIndex];
                };
            } forEach (("true" configClasses (_turretConfig)) apply {configName _x});

            if (_text isEqualTo "") then {
                _text = "Gunner " + str _cargoIndex;
            };
            _icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa";
            rwyl_main_isSeatTaken = alive ((_fullCrew select {(_x # 3) isEqualTo _indexOrPath}) # 0 # 0);
        };
        case ("driver" in rwyl_main_proxy): {
            _text = "Driver";
            _icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa";
            rwyl_main_isSeatTaken = alive driver rwyl_main_vehicle;
        };
        case ("commander" in rwyl_main_proxy): {
            _text = "Commander";
            _icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getincommander_ca.paa";
            rwyl_main_isSeatTaken = alive commander rwyl_main_vehicle;
        };
        case ("pilot" in rwyl_main_proxy): {
            _text = "Pilot";
            _icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa";
            rwyl_main_isSeatTaken = alive driver rwyl_main_vehicle;
        };
    };

    if (rwyl_main_isSeatTaken) then {
        _icon = "\a3\ui_f\data\Map\MapControl\taskIconCanceled_ca.paa";
        _text = _text + " seat taken";
    };

    drawIcon3D [_icon, [1,1,1,1], rwyl_main_vehicle modelToWorld (rwyl_main_vehicle selectionPosition rwyl_main_proxy), 1, 1, 0, _text];

copyToClipboard rwyl_main_proxy;

}, 0, [_unit, _sn, _sp]] call CBA_fnc_addPerFrameHandler;

/*
{

} forEach (selectionNames vehicle player select {
    private _lastChar = _x select [count _x -1];
    ((parseNumber _lastChar > 0) || {_lastChar isEqualTo "0"}) && {
    (("cargo" in toLower _x) || {("gunner" in toLower _x)}) && {
    !((vehicle player selectionPosition _x) isEqualTo [0,0,0])}}
});

*/
