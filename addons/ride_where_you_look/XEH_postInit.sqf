[
    "Ride Where You Look", "amp_rwyl_selectSeat", "Select Seat",{
        [] call amp_rwyl_fnc_findSeat;
    },{
        amp_rwyl_pfh_running = false;
        if (isNull amp_rwyl_vehicle) exitWith {};
        [player, amp_rwyl_proxy] call amp_rwyl_fnc_moveSeat
  }, [45, [false, false, false]], false                  //, 0, true
] call CBA_fnc_addKeybind; // x
