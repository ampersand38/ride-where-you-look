[
    "Ride Where You Look", "rwyl_main_showSeats", "Show Seats (Hold)",
    LINKFUNC(showSeats), { rwyl_main_pfh_running = false; },
    [29, [false, true, false]], false
] call CBA_fnc_addKeybind; // LCTRL

[
    "Ride Where You Look", "rwyl_main_showSeatsToggle", "Show Seats (Toggle)",
    LINKFUNC(showSeats), {}
] call CBA_fnc_addKeybind; //

[
    "Ride Where You Look", "rwyl_main_selectSeat", "Select Seat",
    LINKFUNC(selectSeat), {}
    , [45, [false, true, false]], false
] call CBA_fnc_addKeybind; // LCtrl + x

[
    "Ride Where You Look", "rwyl_main_holdRelease", "Show (Hold) and Select (Release)",
    LINKFUNC(showSeats), LINKFUNC(selectSeat)
] call CBA_fnc_addKeybind; // x

[
    "Ride Where You Look", "rwyl_main_driver", "Get In / Move To Driver",
    LINKFUNC(goDriver), {}
] call CBA_fnc_addKeybind; //

[
    "Ride Where You Look", "rwyl_main_key_ffv", ["FFV Anywhere", "While in a vehicle, switch to an FFV turret attached to the current vehicle. Exit the FFV turret to return to your vehicle seat."],
    LINKFUNC(keyFFV), {}
] call CBA_fnc_addKeybind; //

[
    "Ride Where You Look", "rwyl_main_key_ffvCurator", ["FFV Anywhere (Zeus)", "Selected units in vehicles will FFV. Order them to exit to return to vehicle seat."],
    LINKFUNC(keyFFVcurator), {}
] call CBA_fnc_addKeybind; //
