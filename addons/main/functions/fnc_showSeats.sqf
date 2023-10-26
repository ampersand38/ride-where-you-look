#include "script_component.hpp"
/*
Author: Ampersand
Start PFH to show which seat the unit is looking at

* Arguments:
* -
*
* Return Value:
* -

* Example:
* [] call rwyl_main_fnc_showSeats
*/

if (
    visibleMap
    || (rwyl_main_pfh_running)
) exitWith { rwyl_main_pfh_running = false; systemChat "stop";};

private _unit = call FUNC(getUnit);
if (isNull _unit) exitWith {};

private _currentVehicle = objectParent _unit;

if (isNull curatorCamera) then {
    [_unit] call FUNC(getVehicleUnit)
} else {
    [] call FUNC(getVehicleCurator)
} params ["_vehicle", "_fullCrew"];

if (isNull _vehicle) exitWith {};

rwyl_main_vehicle = _vehicle;
if (!isNull _currentVehicle) then {
    GVAR(currentVehicle) = _currentVehicle;
    private _currentCrew = [_currentVehicle] call FUNC(fullCrew);
    private _currentCrewIndex = _currentCrew findIf {_x select 0 == _unit};
    GVAR(currentSeat) = _currentCrewIndex;
};

GVAR(seats) = [rwyl_main_vehicle] call FUNC(getSeats);
{
    _x set [SEAT_SELPOS, [rwyl_main_vehicle, _x select SEAT_PROXYLOD] call FUNC(getProxyPosition)];
} forEach GVAR(seats);

GVAR(unit) = _unit;
GVAR(indexClosest) = -1;
rwyl_main_pfh_running = true;

[LINKFUNC(showSeatsPFH), 0, _unit] call CBA_fnc_addPerFrameHandler;

/*
// Draw proxies
v = ([[curatorSelected # 0 # 0, [vehicle player, cursorObject] select (vehicle player == player)] select isNull curatorCamera, (get3DENSelected "" # 0 # 0)] select is3DEN);
onEachFrame {
    {
        drawIcon3D ["\a3\missions_f_oldman\Systems\UI\CenterDot\Data\centerDot_ca.paa", [1,1,1,1], v modelToWorldVisual (v selectionPosition [_x, "FireGeometry", "AveragePoint"]), 1, 1, 0, _x];
    } forEach (selectionNames v select {
        !((v selectionPosition [_x, "FireGeometry", "AveragePoint"]) isEqualTo [0,0,0])
    });
};

// Vehicle info
rwyl_main_proxyCache = createHashMap;
_v = call amp_fnc_gv;
_r = [];
_r = _r + [_v] call rwyl_main_fnc_fullCrew;
_r = _r + ((_v selectionNames "firegeometry") select {"proxy" in _x});
_r = _r + ([_v] call rwyl_main_fnc_getSeats);

copyToClipboard (_r joinString endl);
_r;

// Move player
_v = call amp_fnc_gv;
_index = 10;
if (objectParent player == _v) then {
player action ["moveToCargo", _v, _index];
} else {
player moveInCargo [_v, _index];
}
*/
