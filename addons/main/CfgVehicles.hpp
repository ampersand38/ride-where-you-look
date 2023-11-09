class CfgVehicles
{
    class LandVehicle;
    class StaticWeapon: LandVehicle
    {
        class CargoTurret;
        class EventHandlers;
        class Turrets;
    };
    class GVAR(viv_helper): StaticWeapon
    {
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
        hasDriver = 0;
        accuracy = 1000;

        class Turrets: Turrets
        {
            class CargoTurret: CargoTurret
            {
                allowLauncherIn = 1;
                memoryPointsGetInGunner = "pos cargo";
                memoryPointsGetInGunnerDir = "pos cargo dir";
                memoryPointsGetInGunnerPrecise = "pos cargo";
                forceHideGunner = 1;
                gunnerGetInAction = "";
                gunnerGetOutAction = "";
                preciseGetInOut = 1;
                proxyIndex = 1;
                maxElev = 65;
                minElev = -65;
                maxTurn = 95;
                minTurn = -95;
                castGunnerShadow = 1;
                ejectDeadGunner = 1;
                gunnerAction = "passenger_inside_4";
                gunnerInAction = "passenger_inside_4";
                gunnerName = "Cargo FFV";
                animationSourceElevation = "Turn_source";
                //isPersonTurret = 1;        /// enables a person to get into the turret from outside
                //proxyType = "CPCargo";
            };
        };
        class UserActions {};
        class VehicleTransport
        {
            class Cargo {
                parachuteClass = ""; // Type of parachute used when dropped in air. When empty then parachute is not used.
                parachuteHeightLimit = 10000; // Minimal height above terrain when parachute is used.
                canBeTransported = 1; // 0 (false) / 1 (true)
                dimensions[] = { "BBox_1_1_pos", "BBox_1_2_pos" }; // Memory-point-based override of automatic bounding box
            };
        };
    };
}; // CfgVehicles
