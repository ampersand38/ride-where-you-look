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

params ["_unit", ["_useParentVehicle", false]];

// get vehicle
private _notInZeus = isNull curatorCamera;
private _currentVehicle = vehicle _unit;
private _isOnFoot = _currentVehicle == _unit;

// check cursorObject, parentVehicle, and nearEntities
rwyl_main_vehicle = if _useParentVehicle then {
    _currentVehicle
} else {
    if (isNull cursorObject) then {
        if _isOnFoot then {
            // get entity being looked at
            private _reference = [0.5,0.5];
            private _entities = if (_notInZeus) then {
                (_unit nearEntities ["AllVehicles", 3]) - [_unit];
            } else {
                _reference = getMousePosition;
                (screenToWorld getMousePosition nearEntities ["AllVehicles", 10]) - [_unit];
            };

            private _minDistance = 1000;
            private _indexClosest = -1;
            {
                private _w2s = worldToScreen (getPos _x);
                private _distance = if (_w2s isEqualTo []) then {
                    1000
                } else {
                    _reference distance2D _w2s
                };
                if (_distance < _minDistance) then {
                    _minDistance = _distance;
                    _indexClosest = _forEachIndex;
                };
            } forEach _entities;
            if (_indexClosest > -1) then {
                _entities # _indexClosest
            } else {
                objNull
            }
        } else {
            _currentVehicle
        }
    } else {
        if (_isOnFoot && {_notInZeus}) then {
            objNull
        } else {
            cursorObject
        }
    };
};

// check view lineIntersectsSurfaces
if (isNull rwyl_main_vehicle) then {
    if _notInZeus then {
        private _start = AGLtoASL (_unit modelToWorldVisual (_unit selectionPosition "pilot"));
        private _end = (_start vectorAdd (getCameraViewDirection _unit vectorMultiply 3));
        private _objects = lineIntersectsSurfaces [_start, _end, _unit, _currentVehicle];
        rwyl_main_vehicle = (_objects param [0, []]) param [2, objNull];
    } else {
        private _start = AGLtoASL positionCameraToWorld [0,0,0];
        private _end = AGLtoASL screenToWorld getMousePosition;
        private _objects = lineIntersectsSurfaces [_start, _end, _unit];
        rwyl_main_vehicle = (_objects param [0, []]) param [2, objNull];
    };
};

// exit checks
if (isNull rwyl_main_vehicle) exitWith {}; // no vehicle

if (locked rwyl_main_vehicle in [2,3] && {_notInZeus}) exitWith { // locked
    hintSilent "Vehicle Locked";
    rwyl_main_vehicle = objNull;
};

private _fullCrew = fullCrew [rwyl_main_vehicle, "", true];
if (_fullCrew isEqualTo []) exitWith { // no seats
    rwyl_main_vehicle = objNull;
};

// get proxies
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

// hop vehicle filter for near proxies
private _hopVehicle = !_isOnFoot && {(_currentVehicle != rwyl_main_vehicle) && {_notInZeus}};
if (_hopVehicle) then {
    _sn = _sn select {
        (rwyl_main_vehicle selectionPosition _x) distance (rwyl_main_vehicle worldToModel getPos _unit) < 3
    };
};

// filter out blacklisted non-functional proxies
_sn = _sn - getArray (configFile >> "CfgVehicles" >> typeOf rwyl_main_vehicle >> "RWYL_proxyBlacklist");

if (_sn isEqualTo []) exitWith { // no seat proxies found in selectionNames
    rwyl_main_vehicle = objNull;
    if (_hopVehicle) then { // if can't hop vehicle, run for current vehicle
        [_unit, true] call rwyl_main_fnc_findSeat;
    };
};

private _sp = _sn apply {rwyl_main_vehicle selectionPosition _x};

rwyl_main_pfh_running = true;
[{
    params ["_args", "_pfID"];
    _args params ["_unit", "_sn", "_sp"];
    rwyl_main_proxy = nil;
    if (!rwyl_main_pfh_running) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };

    private _reference = if (
        isNull curatorCamera && {
        isNil "ace_interact_menu_openedMenuType" || {ace_interact_menu_openedMenuType < 0}}
    ) then {
        [0.5,0.5]
    } else {
        getMousePosition
    };

    private _minDistance = 1000;
    private _screenPosArray = [];
    private _indexClosest = -1;
    {
        private _w2s = worldToScreen (rwyl_main_vehicle modelToWorldVisual _x);
        private _distance = if (_w2s isEqualTo []) then {
            1000
        } else {
            _reference distance2D _w2s
        };
        if (_distance < _minDistance) then {
            _minDistance = _distance;
            _indexClosest = _forEachIndex;
        };
        _screenPosArray pushBack _distance;
    } forEach _sp;

    // no seat proxies on screen
    if (_indexClosest == -1) exitWith {
        rwyl_main_vehicle = objNull;
    };

    rwyl_main_proxy = toLower (_sn # _indexClosest);

    if RWYL_ShowAllSeats then {
        _screenPosArray deleteAt _indexClosest;
        {
            if (_forEachIndex != _indexClosest) then {
                drawIcon3D [
                    "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_getin_ca.paa",
                    [1,1,1,0.5],
                    rwyl_main_vehicle modelToWorldVisual _x,
                    1, 1, 0,""
                ];
            };
        } forEach _sp;
    };

    // update crew get in/out in PFH
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

    drawIcon3D [_icon, [1,1,1,1], rwyl_main_vehicle modelToWorldVisual (rwyl_main_vehicle selectionPosition rwyl_main_proxy), 1, 1, 0, _text];

}, 0, [_unit, _sn, _sp]] call CBA_fnc_addPerFrameHandler;

/*
// draw proxies
v = ([[curatorSelected # 0 # 0, [vehicle player, cursorObject] select (vehicle player == player)] select isNull curatorCamera, (get3DENSelected "" # 0 # 0)] select is3DEN);
onEachFrame {
    {
        drawIcon3D ["\a3\missions_f_oldman\Systems\UI\CenterDot\Data\centerDot_ca.paa", [1,1,1,1], v modelToWorldVisual (v selectionPosition _x), 1, 1, 0, _x];
    } forEach (selectionNames v select {
        !((v selectionPosition _x) isEqualTo [0,0,0])
    });
};
*/
