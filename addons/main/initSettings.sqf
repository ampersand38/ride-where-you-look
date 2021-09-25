[
    "RWYL_ShowAllSeats", "CHECKBOX",
    ["Show All Seats", "Show all selectable seats as translucent generic icon."],
    "Ride Where You Look",
    true, // default value
    false, // isGlobal
    {},
    false // needRestart
] call CBA_settings_fnc_init;

[
    "RWYL_HopVehicleRange", "SLIDER",
    ["Hop Vehicle Range", "Maximum distance across which players can jump to a different vehicle."],
    "Ride Where You Look",
    [1, 10, 5, 0], // default value
    true, // isGlobal
    {},
    false // needRestart
] call CBA_settings_fnc_init;
