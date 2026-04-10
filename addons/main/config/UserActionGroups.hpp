class UserActionGroups {
    class GVAR(UserActionGroups) {
        name = CSTRING(ModName); // Display name of your category.
        isAddon = 1;
        group[] = { // List of all actions inside this category.
            QGVAR(showSeats),
            QGVAR(showSeatsToggle),
            QGVAR(selectSeat),
            QGVAR(holdRelease),
            QGVAR(driver),
            QGVAR(key_ffv),
            QGVAR(key_ffvCurator)
        };
    };
};
