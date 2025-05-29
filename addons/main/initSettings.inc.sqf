[
    "RWYL_SelectedSeatColour", "COLOR",
    ["Selected Seat Colour", "Colour of the icon for the currently selected seat."],
    "Ride Where You Look",
    ["IGUI", "TEXT_RGB"] call BIS_fnc_displayColorGet, // default value
    false, // isGlobal
    {},
    false // needRestart
] call CBA_settings_fnc_init;

[
    "RWYL_SelectedSeatIconSize", "SLIDER",
    ["Selected Seat Icon Size", "Size of the icon the currently selected seat."],
    "Ride Where You Look",
    [1, 10, 1, 2], // default value
    false, // isGlobal
    {},
    false // needRestart
] call CBA_settings_fnc_init;

[
    "RWYL_OtherSeatsColour", "COLOR",
    ["Other Seat Colour", "Colour of the icon(s) for the other seat(s)."],
    "Ride Where You Look",
    ["IGUI", "BCG_RGB"] call BIS_fnc_displayColorGet, // default value
    false, // isGlobal
    {},
    false // needRestart
] call CBA_settings_fnc_init;

[
    "RWYL_OtherSeatsIconSize", "SLIDER",
    ["Other Seat Icon Size", "Size of the icon(s) for the other seat(s)."],
    "Ride Where You Look",
    [1, 10, 0.8, 2], // default value
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
