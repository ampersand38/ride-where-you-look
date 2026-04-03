#define COMPONENT main
#include "\z\rwyl\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MAIN
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MAIN
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MAIN
#endif

#include "\z\rwyl\addons\main\script_macros.hpp"

#define CLEANUP GVAR(distance) = -1; \
    GVAR(currentVehicle) = objNull; \
    GVAR(currentSeat) = -1; \
    GVAR(vehicle) = objNull; \
    GVAR(unit) = objNull; \
    GVAR(indexClosest) = -1; \
    GVAR(seats) = []; \
    deleteVehicle GVAR(viv_helper)
