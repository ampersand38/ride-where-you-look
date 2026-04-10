[
    "RWYL_ThirdPerson_enable",
    "CHECKBOX",
    [LSTRING(ThirdPerson), LSTRING(ThirdPerson_Tooltip)],
    LSTRING(ModName),
    true, // default value
    false, // isGlobal
    {},
    false // needRestart
] call CBA_Settings_fnc_init;

[
    "RWYL_SelectedSeatColour", "COLOR",
    [LSTRING(SelectedSeatColour), LSTRING(SelectedSeatColour_Tooltip)],
    LSTRING(ModName),
    ["IGUI", "TEXT_RGB"] call BIS_fnc_displayColorGet, // default value
    false, // isGlobal
    {},
    false // needRestart
] call CBA_settings_fnc_init;

[
    "RWYL_SelectedSeatIconSize", "SLIDER",
    [LSTRING(SelectedSeatIconSize), LSTRING(SelectedSeatIconSize_Tooltip)],
    LSTRING(ModName),
    [1, 10, 1, 2], // default value
    false, // isGlobal
    {},
    false // needRestart
] call CBA_settings_fnc_init;

[
    "RWYL_OtherSeatsColour", "COLOR",
    [LSTRING(OtherSeatsColour), LSTRING(OtherSeatsColour_Tooltip)],
    LSTRING(ModName),
    ["IGUI", "BCG_RGB"] call BIS_fnc_displayColorGet, // default value
    false, // isGlobal
    {},
    false // needRestart
] call CBA_settings_fnc_init;

[
    "RWYL_OtherSeatsIconSize", "SLIDER",
    [LSTRING(OtherSeatsIconSize), LSTRING(OtherSeatsIconSize_Tooltip)],
    LSTRING(ModName),
    [1, 10, 0.8, 2], // default value
    false, // isGlobal
    {},
    false // needRestart
] call CBA_settings_fnc_init;

[
    "RWYL_HopVehicleRange", "SLIDER",
    [LSTRING(HopVehicleRange), LSTRING(HopVehicleRange_Tooltip)],
    LSTRING(ModName),
    [1, 10, 5, 0], // default value
    true, // isGlobal
    {},
    false // needRestart
] call CBA_settings_fnc_init;

[
    "RWYL_FFVAnywhere_enable",
    "CHECKBOX",
    [LSTRING(FFVAnywhere), LSTRING(FFVAnywhere_Tooltip)],
    LSTRING(ModName),
    false, // default value
    true, // isGlobal
    {},
    false // needRestart
] call CBA_Settings_fnc_init;
