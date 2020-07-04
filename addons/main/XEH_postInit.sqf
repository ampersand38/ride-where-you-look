#include "script_component.hpp"

["rwyl_main_moveSeat", {
    params ["_unit", "_role", "_cargoIndex", "_turretPath"];
    if (rwyl_main_vehicle == vehicle _unit) then {moveOut _unit;};
    [{
        params ["_unit"];
        vehicle _unit == _unit
    },{
        params ["_unit", "_role", "_cargoIndex", "_turretPath"];
        if (toLower _role isEqualTo "cargo") then {
            _unit moveInCargo [rwyl_main_vehicle, _cargoIndex];
        } else {
            _unit moveInTurret [rwyl_main_vehicle, _turretPath];
        };
        rwyl_main_vehicle = objNull;
        rwyl_main_proxy = nil;
    }, [_unit, _role, _cargoIndex, _turretPath]] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

[
    "Ride Where You Look", "rwyl_main_selectSeat", "Select Seat",{
        if (isNull curatorCamera) then {
            [player] call rwyl_main_fnc_findSeat;
        } else {
            if (count (curatorSelected # 0) == 1) then {
                [curatorSelected # 0 # 0] call rwyl_main_fnc_findSeat;
            };
        };
    },{
        rwyl_main_pfh_running = false;
        if (isNull curatorCamera) then {
            [player] call rwyl_main_fnc_moveSeat;
        } else {
            if (count (curatorSelected # 0) == 1) then {
                [curatorSelected # 0 # 0] call rwyl_main_fnc_moveSeat;
            };
        };
  }, [45, [false, false, false]], false                  //, 0, true
] call CBA_fnc_addKeybind; // x
