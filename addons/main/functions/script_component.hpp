#include "\z\rwyl\addons\main\script_component.hpp"

#define SEAT_ID 0
#define SEAT_ROLE 1
#define SEAT_CARGOINDEX 2
#define SEAT_TURRETPATH 3
#define SEAT_PROXYINDEX 4
#define SEAT_ACTIONINDEX 5
#define SEAT_NAME 6
#define SEAT_PROXYLOD 7
#define SEAT_SELPOS 8
#define SEAT_ICON 9
#define SEAT_COMPARTMENT 10

#define PROXY_ROLES ["cargo","gunner","driver","commander","pilot"]

#define ICON_CARGO "\a3\ui_f\data\IGUI\Cfg\Actions\getincargo_ca.paa"
#define ICON_COMMANDER "\a3\ui_f\data\IGUI\Cfg\Actions\getincommander_ca.paa"
#define ICON_DRIVER "\a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa"
#define ICON_GUNNER "\a3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa"
#define ICON_PILOT "\a3\ui_f\data\IGUI\Cfg\Actions\getinpilot_ca.paa"
#define ICON_CANCEL "\a3\ui_f\data\Map\MapControl\taskIconCanceled_ca.paa"
#define ICON_VIV "\a3\data_f_destroyer\Data\ui\igui\cfg\holdactions\holdaction_loadVehicle_ca.paa"

#define CLEANUP GVAR(distance) = -1; \
    GVAR(currentVehicle) = objNull; \
    GVAR(currentSeat) = -1; \
    GVAR(vehicle) = objNull; \
    GVAR(unit) = objNull; \
    GVAR(indexClosest) = -1; \
    GVAR(seats) = []; \
    deleteVehicle GVAR(viv_helper)
