class CfgPatches {
    class AMP_RWYL {
        name = Ride Where You Look;
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.0;
        requiredAddons[] = {"cba_common"};
        author = "Ampersand";
        authors[] = {"Ampersand"};
    };
};

class CfgFunctions {
    class amp_rwyl {
        tag = "amp_rwyl";
        class functions {
            file = "\ride_where_you_look\functions";
            class findSeat;
            class moveSeat;
        };
    };
};
