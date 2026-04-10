class UserActionsConflictGroups {
    class ActionGroups {
        GVAR(ActionGroup)[] = {
            QGVAR(showSeats),
            QGVAR(showSeatsToggle),
            QGVAR(selectSeat),
            QGVAR(holdRelease),
            QGVAR(driver),
            QGVAR(key_ffv),
            QGVAR(key_ffvCurator)
        };
    };

    class CollisionGroups {
        // Add your group to an existing collision group:
        //carMove[] += {"TAG_MyActionGroup"};

        // Or alternatively add your own collision group (which is usually preferrable):
        GVAR(ActionGroupCollisions)[] = {"basic", "vehBasic", "HeadMove", "aircraft", "heli", QGVAR(ActionGroup)};
    };
};
