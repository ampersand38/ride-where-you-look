[
    "Ride Where You Look", "rwyl_main_showSeats", "Show Seats (Hold)",
    LINKFUNC(showSeats), { rwyl_main_pfh_running = false; },
    [29, [false, false, false]], false
] call CBA_fnc_addKeybind; // LCTRL

[
    "Ride Where You Look", "rwyl_main_showSeatsToggle", "Show Seats (Toggle)",
    LINKFUNC(showSeats),{}
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
