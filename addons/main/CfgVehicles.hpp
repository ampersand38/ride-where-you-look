class CfgVehicles {
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class CargoTurret;
        class EventHandlers;
        class Turrets;
    };
    class GVAR(viv_helper): StaticWeapon {
        _generalMacro = "";
        author = "Ampersand";
        displayName = "Cargo FFV";
        scope = 1;
        scopeCurator = 1;
        model = QPATHTOF(data\cargoTurret.p3d);
        extCameraPosition[] = {0, 0.300000, -3.500000};	// man
        icon = "iconObject_1x1";
        picture = "\A3\Air_F_Heli\Heli_Transport_04\Data\UI\Pod_Heli_Transport_04_bench_CA.paa";
        disableInventory = 1;
        showNVGCargo[] = {1};
        hasDriver = 0;
        accuracy = 1000;

        class Turrets: Turrets {
            class CargoTurret: CargoTurret {
                allowLauncherIn = 1;
                memoryPointsGetInGunner = "pos cargo";
                memoryPointsGetInGunnerDir = "pos cargo dir";
                memoryPointsGetInGunnerPrecise = "pos cargo";
                gunnerGetInAction = "";
                gunnerGetOutAction = "";
                preciseGetInOut = 1;
                proxyIndex = 1;
                maxElev = 65;
                minElev = -65;
                maxTurn = 179;
                minTurn = -179;
                canUseScanners = 1;
                ejectDeadGunner = 1;
                gunnerAction = "passenger_inside_4";
                gunnerInAction = "passenger_inside_4";
                gunnerName = "Cargo FFV";
                animationSourceElevation = "Turn_source";
                elevationAnimSourceSpeed = 0.2;
                showHMD = 1;

                //isPersonTurret = 1;
                //proxyType = "CPCargo";
            };
        };
        class UserActions {};
        class VehicleTransport {
            class Cargo {
                parachuteClass = ""; // Type of parachute used when dropped in air. When empty then parachute is not used.
                parachuteHeightLimit = 10000; // Minimal height above terrain when parachute is used.
                canBeTransported = 1; // 0 (false) / 1 (true)
                dimensions[] = { "BBox_1_1_pos", "BBox_1_2_pos" }; // Memory-point-based override of automatic bounding box
            };
        };
    }; // GVAR(viv_helper)

    #define FFVTURRET(act) class GVAR(act): GVAR(viv_helper) { \
        displayName = QUOTE(ffv act); \
        class Turrets: Turrets { \
            class CargoTurret: CargoTurret { \
                gunnerAction = QUOTE(act); \
                gunnerInAction = QUOTE(act); \
            }; \
        }; \
    }

    FFVTURRET(passenger_inside_1); // Seat, Knee up
    FFVTURRET(passenger_inside_2); // Seat, Knee mid
    FFVTURRET(passenger_inside_3); // Seat, Knee down
    FFVTURRET(passenger_inside_4); // Right Knee Left Foot
    FFVTURRET(passenger_inside_5); // Right Knee Left Foot
    FFVTURRET(passenger_inside_6); // Stand, low
    FFVTURRET(passenger_inside_7); // Seat, Knee up
    FFVTURRET(passenger_inside_8); // Seat, Knee down
    FFVTURRET(passenger_bench_1); // Seat, Knee down
    FFVTURRET(passenger_boat_1); // Prone
    FFVTURRET(passenger_boat_2); // Prone
    FFVTURRET(passenger_boat_3); // Floor, side legs
    FFVTURRET(passenger_boat_4); // Floor, left leg cross, right knee up
    FFVTURRET(passenger_flatground_1); // Floor, legs half forward
    FFVTURRET(passenger_flatground_2); // Floor, Knees to armpits
    FFVTURRET(passenger_flatground_3); // Floor, legs crossed
    FFVTURRET(passenger_flatground_4); // Floor, left leg cross, right knee up
    FFVTURRET(vehicle_turnout_1); // Stand, low
    FFVTURRET(vehicle_turnout_2); // Stand, low
    FFVTURRET(vehicle_coshooter_1); // Seat, Knee up
    FFVTURRET(vehicle_passenger_stand_1); // Stand
    FFVTURRET(vehicle_passenger_stand_2); // Hunched
}; // CfgVehicles

/*
// Spawn all helpers
if true exitWith {
    {
        private _viv_helper = _x createVehicle [0, 0, 1000];
        _viv_helper attachTo [vehicle player, [1+1*_forEachIndex, 0, 0]];
        private _unit = group player createUnit [typeOf player, position player, [], 0, "NONE"];
        _unit moveInAny _viv_helper;
    } forEach [
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
    ];
};
*/
