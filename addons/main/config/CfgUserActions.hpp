class CfgUserActions {
    class GVAR(showSeats) { // This class name is used for internal representation and also for the inputAction command.
        displayName = CSTRING(showSeats);
        tooltip = "";
        onActivate = QUOTE([] call FUNC(showSeats));		// _this is always true.
        onDeactivate = QUOTE(rwyl_main_pfh_running = false;);		// _this is always false.
        //onAnalog = QUOTE(call FUNC(inputBlindFireToggle);	// _this is the scalar analog value.
        //analogChangeThreshold = 0.1; // Minimum change required to trigger the onAnalog EH (default: 0.01).
    };
    class GVAR(showSeatsToggle) { // This class name is used for internal representation and also for the inputAction command.
        displayName = CSTRING(showSeatsToggle);
        tooltip = "";
        onActivate = QUOTE([] call FUNC(showSeats));		// _this is always true.
    };
    class GVAR(selectSeat) { // This class name is used for internal representation and also for the inputAction command.
        displayName = CSTRING(selectSeat);
        tooltip = "";
        onActivate = QUOTE([] call FUNC(selectSeat));		// _this is always true.
    };
    class GVAR(holdRelease) { // This class name is used for internal representation and also for the inputAction command.
        displayName = CSTRING(holdRelease);
        tooltip = "";
        onActivate = QUOTE([] call FUNC(showSeats));		// _this is always true.
        onDeactivate = QUOTE([] call FUNC(selectSeat));		// _this is always true.
    };
    class GVAR(key_ffv) { // This class name is used for internal representation and also for the inputAction command.
        displayName = CSTRING(key_ffv);
        tooltip = CSTRING(key_ffv_Tooltip);
        onActivate = QUOTE([] call FUNC(keyFFV));		// _this is always true.
    };
    class GVAR(key_ffvCurator) { // This class name is used for internal representation and also for the inputAction command.
        displayName = CSTRING(key_ffvCurator);
        tooltip = CSTRING(key_ffvCurator_Tooltip);
        onActivate = QUOTE([] call FUNC(keyFFVcurator));		// _this is always true.
    };
};
