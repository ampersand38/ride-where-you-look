#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(passenger_inside_1),
            QGVAR(passenger_inside_2),
            QGVAR(passenger_inside_3),
            QGVAR(passenger_inside_4),
            QGVAR(passenger_inside_5),
            QGVAR(passenger_inside_6),
            QGVAR(passenger_inside_7),
            QGVAR(passenger_inside_8),
            QGVAR(passenger_bench_1),
            QGVAR(passenger_boat_1),
            QGVAR(passenger_boat_2),
            QGVAR(passenger_boat_3),
            QGVAR(passenger_boat_4),
            QGVAR(passenger_flatground_1),
            QGVAR(passenger_flatground_2),
            QGVAR(passenger_flatground_3),
            QGVAR(passenger_flatground_4),
            QGVAR(vehicle_turnout_1),
            QGVAR(vehicle_turnout_2),
            QGVAR(vehicle_coshooter_1),
            QGVAR(vehicle_passenger_stand_1),
            QGVAR(vehicle_passenger_stand_2)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_common"};
        author = "Ampersand";
        authors[] = {"Ampersand"};
        authorUrl = "https://github.com/ampersand38/ride-where-you-look";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
