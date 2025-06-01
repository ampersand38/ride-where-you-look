#include "script_component.hpp"
/*
Author: Ampersand
Move into driver seat

* Arguments:
* -
*
* Back
 Value:
* -
*
* Exrwylle:
* [] call rwyl_main_fnc_goDriver
*/

if (!isNull curatorCamera) exitWith {};

[focusOn] call FUNC(getVehicleUnit) params ["_vehicle"];

if (isNull _vehicle) exitWith {};

rwyl_main_vehicle = _vehicle;
GVAR(seats) = +([rwyl_main_vehicle] call FUNC(getSeats));

private _indexDriver = GVAR(seats) findIf {_x select 1 == "driver"};

if (_indexDriver == -1) exitWith {};

_fullCrew select _indexDriver params ["_currentDriver"];

if (
    focusOn == _currentDriver
    || {[_currentDriver] call FUNC(isBlocking)}
) exitWith {};

GVAR(unit) = focusOn;
GVAR(indexClosest) = _indexDriver;
GVAR(currentVehicle) = objectParent focusOn;
private _currentCrew = [_currentVehicle] call FUNC(fullCrew);
private _currentCrewIndex = _currentCrew findIf {_x select 0 == _unit};
GVAR(currentSeat) = _currentCrewIndex;

[] call FUNC(selectSeat);

CLEANUP;
