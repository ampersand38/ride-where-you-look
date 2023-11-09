/*
Author: Ampersand
EH fired when unit exits the ViV helper

* Arguments:
* 0: Vehicle <OBJECT>
* 0: nil
* 0: Unit <OBJECT>
*
* Return Value:
* None

* Example:
* [_vehicle] call ssl_main_fnc_ehGetOut
*/

//params ["_vehicle", "_role", "_unit", "_turret"];
params [["_vehicle", objNull]];

if (!isNull isVehicleCargo _vehicle) then {
    objNull setVehicleCargo _vehicle;
};
deleteVehicle _vehicle;
