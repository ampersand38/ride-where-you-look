#include "script_component.hpp"

["rwyl_main_moveSeatLocal", {
    //params ["_unit", "_vehicle", "_proxy"];
    call rwyl_main_fnc_moveSeatLocal;
}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

#include "initVehicles.sqf"

[
    "Ride Where You Look", "rwyl_main_showSeats", "Show Seats (Hold)",{
        if (visibleMap) exitWith {};
        if (isNull curatorCamera) then {
            [player] call rwyl_main_fnc_findSeat;
        } else {
            if (count (curatorSelected # 0) == 1) then {
                private _unit = (curatorSelected # 0 # 0);
                if (_unit isKindOf "CAManBase") then {
                    [_unit] call rwyl_main_fnc_findSeat;
                };
            };
        };
    },{
        rwyl_main_pfh_running = false;
        //rwyl_main_vehicle = nil;
        //rwyl_main_proxy = nil;
    }, [29, [false, false, false]], false                  //, 0, true
] call CBA_fnc_addKeybind; // LCTRL

[
    "Ride Where You Look", "rwyl_main_showSeatsToggle", "Show Seats (Toggle)",{
        if (visibleMap) exitWith {};
        if rwyl_main_pfh_running then {
            rwyl_main_pfh_running = false;
        } else {
            if (isNull curatorCamera) then {
                [player] call rwyl_main_fnc_findSeat;
            } else {
                private _unit = (curatorSelected # 0 # 0);
                if (_unit isKindOf "CAManBase") then {
                    [_unit] call rwyl_main_fnc_findSeat;
                };
            };
        };
    },{}                  //, 0, true
] call CBA_fnc_addKeybind; //

[
    "Ride Where You Look", "rwyl_main_selectSeat", "Select Seat",{
        if (!rwyl_main_pfh_running) exitWith {};
        if (isNull curatorCamera) then {
            [player] call rwyl_main_fnc_moveSeat;
        } else {
            if (count (curatorSelected # 0) == 1) then {
                [curatorSelected # 0 # 0] call rwyl_main_fnc_moveSeat;
            };
        };
        rwyl_main_pfh_running = false;
    },{
    }, [45, [false, true, false]], false                  //, 0, true
] call CBA_fnc_addKeybind; // x
