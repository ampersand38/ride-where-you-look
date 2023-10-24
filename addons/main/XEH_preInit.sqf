#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.sqf"

rwyl_main_vehicle_distance = -1;
GVAR(proxyCache) = createHashMap;

ADDON = true;
