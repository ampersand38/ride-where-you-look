class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_GetOut_EventHandlers {
    class GVAR(viv_helper) {
        class GVAR(viv_helper) {
            getOut = QUOTE(call FUNC(ehGetOut));
        };
    };
};

class Extended_Init_EventHandlers {
    class GVAR(viv_helper) {
        class GVAR(viv_helper) {
            init = "(_this select 0) addEventHandler ['CargoUnloaded', {_this call rwyl_main_fnc_ehCargoUnloaded}]";
        };
    };
};
