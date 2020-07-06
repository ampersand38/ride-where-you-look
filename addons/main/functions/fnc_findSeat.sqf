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

rwyl_main_vehicle = vehicle _unit;
if (rwyl_main_vehicle == _unit) then {
    private _start = AGLtoASL (_unit modelToWorldVisual (_unit selectionPosition "pilot"));
    private _end = (_start vectorAdd (getCameraViewDirection _unit vectorMultiply 3));
    private _objects = lineIntersectsSurfaces [_start, _end, _unit];
    rwyl_main_vehicle = (_objects param [0, []]) param [2, objNull];
};

if (isNull rwyl_main_vehicle) exitWith {"no pfh"};
if (locked rwyl_main_vehicle in [2,3]) exitWith {
    hintSilent "Vehicle Locked";
    false
};

rwyl_main_pfh_running = true;
[{
    params ["", "_pfID"];
    rwyl_main_proxy = nil;
    if (!rwyl_main_pfh_running) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };

    private _sn = selectionNames rwyl_main_vehicle select {
        private _lastChar = _x select [count _x -1];
        private _proxyIndex = _x select [(_x find ".") + 1];
        //((parseNumber _lastChar > 0) || {_lastChar isEqualTo "0"}) && {
        ((parseNumber _proxyIndex > 0) || {_proxyIndex isEqualTo "0"}) && {
        (("cargo" in toLower _x)) && {
        !((rwyl_main_vehicle selectionPosition _x) isEqualTo [0,0,0])}}
    };

    if (_sn isEqualTo []) exitWith {
        rwyl_main_vehicle = objNull;
        "no seat proxies found in selectionNames"
    };

    private _sp = _sn apply {rwyl_main_vehicle selectionPosition _x};

    private _screenPosArray = _sp apply {
        private _w2s = worldToScreen (rwyl_main_vehicle modelToWorld _x);
        if (_w2s isEqualTo []) then {
            1000
        } else {
            //([getMousePosition, [0.5,0.5]] select (isNull curatorCamera)) distance2D _w2s
            getMousePosition distance2D _w2s
        };
    };

    rwyl_main_proxy = _sn # (_screenPosArray findIf {_x == selectMin _screenPosArray});

    if (isNil "rwyl_main_proxy") exitWith {
        rwyl_main_vehicle = objNull;
        "no seat proxies on screen"
    };

    // get all cargo seat indexes
    private _fullCrew = fullCrew [rwyl_main_vehicle, "", true];

    // get cargo index from proxy name
    private _cargoIndexStr = rwyl_main_proxy select [(rwyl_main_proxy find ".") + 1];

    private _role = "";
    private _cargoIndex = -1;
    private _turretPath = [];

    {
        //_x params ["_seatOccupant", "_seatRole", "_seatCargoIndex", "_seatTurretPath"];
        _x params ["_seatOccupant", "_seatRole", "_seatCargoIndex", "_seatTurretPath"];
        if (
            (isNull _seatOccupant || {!alive _seatOccupant}) && {
            parseNumber _cargoIndexStr == _seatCargoIndex + 1}
        ) then {
            _cargoIndex = _seatCargoIndex;
            _role = _seatRole;
            _turretPath = _seatTurretPath;
        };
    } forEach _fullCrew;

    private _icon = "\a3\3den\Data\Cfg3DEN\Object\iconCargo_ca.paa";
    private _text = rwyl_main_proxy select [(rwyl_main_proxy find ".") + 1];
    //private _text = rwyl_main_proxy;

    // check seat type of proxy
/*
    switch (true) do {
        case ("cargo" in toLower rwyl_main_proxy): {
            _icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getincargo_ca.paa";
        };
        case ("gunner" in toLower rwyl_main_proxy): {
            _icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa";
        };
        case ("driver" in toLower rwyl_main_proxy): {
            _icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa";
        };
        case ("commander" in toLower rwyl_main_proxy): {
            _icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getincommander_ca.paa";
        };
        case ("pilot" in toLower rwyl_main_proxy): {
            _icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getinpilot_ca.paa";
        };
    };
*/
    drawIcon3D [_icon, [1,1,1,1], rwyl_main_vehicle modelToWorld (rwyl_main_vehicle selectionPosition rwyl_main_proxy), 1, 1, 0, _text];
}, 0] call CBA_fnc_addPerFrameHandler;

/*
{

} forEach (selectionNames vehicle player select {
    private _lastChar = _x select [count _x -1];
    ((parseNumber _lastChar > 0) || {_lastChar isEqualTo "0"}) && {
    (("cargo" in toLower _x) || {("gunner" in toLower _x)}) && {
    !((vehicle player selectionPosition _x) isEqualTo [0,0,0])}}
});

*/
