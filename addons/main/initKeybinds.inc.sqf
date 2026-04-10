[
    LSTRING(ModName), QGVAR(showSeats), LSTRING(showSeats),
    LINKFUNC(showSeats), { rwyl_main_pfh_running = false; },
    [29, [false, true, false]], false
] call CBA_fnc_addKeybind; // LCTRL

[
    LSTRING(ModName), QGVAR(showSeatsToggle), LSTRING(showSeatsToggle),
    LINKFUNC(showSeats), {}
] call CBA_fnc_addKeybind; //

[
    LSTRING(ModName), QGVAR(selectSeat), LSTRING(selectSeat),
    LINKFUNC(selectSeat), {}
    , [45, [false, true, false]], false
] call CBA_fnc_addKeybind; // LCtrl + x

[
    LSTRING(ModName), QGVAR(holdRelease), LSTRING(holdRelease),
    LINKFUNC(showSeats), LINKFUNC(selectSeat)
] call CBA_fnc_addKeybind; // x

[
    LSTRING(ModName), QGVAR(driver), LSTRING(driver),
    LINKFUNC(goDriver), {}
] call CBA_fnc_addKeybind; //

[
    LSTRING(ModName), QGVAR(key_ffv),
    [
        LSTRING(key_ffv),
        LSTRING(key_ffv_Tooltip)
    ],
    LINKFUNC(keyFFV), {}
] call CBA_fnc_addKeybind; //

[
    LSTRING(ModName), QGVAR(key_ffvCurator),
    [
        LSTRING(key_ffvCurator),
        LSTRING(key_ffvCurator_Tooltip)
    ],
    LINKFUNC(keyFFVcurator), {}
] call CBA_fnc_addKeybind; //
