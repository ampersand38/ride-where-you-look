if (isClass (configFile >> "CfgPatches" >> "CUP_Vehicles_Core")) then {
    ["CUP_UAZ_Armed_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\uaz\cargo01.001",
            "proxy:\a3\data_f\proxies\gunner_standup01\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_UAZ_AA_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\uaz\cargo01.001",
            "proxy:\ca\temp\proxies\basiccrew\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_Hilux_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\hilux\driver.001",
            "proxy:\ca\temp\proxies\hilux\cargo01.001",
            "proxy:\a3\data_f\proxies\passenger_hunter_front\cargo01.002",
            "proxy:\a3\data_f\proxies\passenger_hunter_front\cargo01.003",
            "proxy:\a3\data_f\proxies\passenger_hunter_front\cargo01.004",
            "proxy:\a3\data_f\proxies\passenger_hunter_front\cargo01.005"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_Hilux_igla_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\hilux\driver.001",
            "proxy:\ca\temp\proxies\hilux\cargo01.001",
            "proxy:\ca\temp\proxies\basiccrew\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_Hilux_MLRS_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\hilux\driver.001",
            "proxy:\a3\data_f\proxies\gunner_standup01\gunner.001"
        ]];
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:\ca\temp\proxies\hilux\cargo01.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_Hilux_UB32_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\hilux\driver.001",
            "proxy:\a3\data_f\proxies\gunner_standup01\gunner.001"
        ]];
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:\ca\temp\proxies\hilux\cargo01.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_Hilux_zu23_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\hilux\driver.001",
            "proxy:\ca\temp\proxies\hilux\cargo01.001",
            "proxy:\ca\temp\proxies\basiccrew\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_Ural_BaseTurret", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\truck\cargo01.001",
            "proxy:\ca\temp\proxies\truck\cargo01.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_BM21_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\truck\cargo01.001",
            "proxy:\ca\temp\proxies\truck\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_Kamaz_5350_ReAmmo_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.001",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.002",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.015",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.016"
        ]];
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:\a3\data_f\proxies\medevac_cargo\cargo01.005",
            "proxy:\a3\data_f\proxies\medevac_cargo\cargo01.013",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.007",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.012",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.014",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.003",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.008",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.009",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.010",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.004",
            "proxy:\a3\data_f\proxies\passenger_generic01_foldhands\cargo01.006",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.011"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_Kamaz_5350_Refuel_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\a3\data_f\proxies\truck_02\cargo01.001",
            "proxy:\a3\data_f\proxies\truck_02\cargo01.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_Kamaz_5350_Repair_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\a3\data_f\proxies\truck_02\cargo01.001",
            "proxy:\a3\data_f\proxies\truck_02\cargo01.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_2S6_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\bmp2\driver.001",
            "proxy:\ca\temp\proxies\zsu\commander.001",
            "proxy:\ca\temp\proxies\zsu\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_BMP1_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\bmp2\driver.001",
            "proxy:\ca\temp\proxies\bmp2\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_BMP2_Ambul_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\bmp2\driver.001",
            "proxy:\ca\temp\proxies\bmp2\commander.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_BMP2_HQ_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\bmp2\commander.001",
            "proxy:\ca\temp\proxies\hmmwv50\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_T55_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\m113\driver.001",
            "proxy:\ca\temp\proxies\t55\commander.001",
            "proxy:\ca\temp\proxies\t55\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_ZSU23_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\zsu\gunner.001",
            "proxy:\ca\temp\proxies\zsu\commander.001"
        ]];
        (_this select 0) setVariable ["RWYL_proxyWhitelist", [
            "proxy:\ca\temp\proxies\zsu\driver.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_T72_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\t72\driver.001",
            "proxy:\ca\temp\proxies\t72\gunner.001",
            "proxy:\ca\temp\proxies\t72\commander.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_ZU23_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\basiccrew\gunner.001",
            "proxy:\ca\temp\proxies\hilux\cargo01.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_KORD_MiniTripod_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\kord\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_Igla_AA_pod_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\basiccrew\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_O_PBX_RU", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\pbx\driver.001",
            "proxy:\ca\temp\proxies\pbx\cargo.001",
            "proxy:\ca\temp\proxies\pbx\cargo.002",
            "proxy:\ca\temp\proxies\pbx\cargo.003"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_B_Zodiac_USMC", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\zodiac\cargo02.002",
            "proxy:\ca\temp\proxies\zodiac\cargo01.001",
            "proxy:\ca\temp\proxies\zodiac\cargo03.003",
            "proxy:\ca\temp\proxies\zodiac\cargo04.004",
            "proxy:\ca\temp\proxies\zodiac\driver.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_B_RM70_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\rm-70\mg_gunner\gunner.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_HMMWV_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\uaz\cargo01.001",
            "proxy:\ca\temp\proxies\hmmwv\driver.001",
            "proxy:\ca\temp\proxies\uaz\cargo01.003",
            "proxy:\ca\temp\proxies\hmmwv\cargo01.002",
            "proxy:\ca\temp\proxies\hmmwv\cargo01.003",
            "proxy:\ca\temp\proxies\hmmwv50\gunner.001",
            "proxy:\ca\temp\proxies\hmmwv240\gunner.001",
            "proxy:\ca\temp\proxies\hmmwvtow\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_RG31_BASE", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\m113\driver.001",
            "proxy:\ca\temp\proxies\uaz\cargo01.001",
            "proxy:\ca\temp\proxies\hmmwv\cargo01.002",
            "proxy:\ca\temp\proxies\hmmwv\cargo01.004",
            "proxy:\ca\temp\proxies\hmmwv\cargo01.003",
            "proxy:\ca\temp\proxies\m113\gunner.001",
            "proxy:\ca\temp\proxies\hmmwv\cargo01.001",
            "proxy:commander.001",
            "proxy:\ca\temp\proxies\hmmwv\cargo01.005",
            "proxy:\ca\temp\proxies\hmmwv\cargo01.006"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_LR_Ambulance_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\landrover\cargo.001",
            "proxy:\ca\temp\proxies\landrover\driver.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_LR_Transport_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\landrover\cargo.001",
            "proxy:\ca\temp\proxies\landrover\driver.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_LR_MG_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\landrover\driver.001",
            "proxy:\ca\temp\proxies\landrover\cargo01.001",
            "proxy:\a3\data_f\proxies\gunner_standup01\gunner.001",
            "proxy:\a3\data_f\proxies\passenger_generic01_foldhands\cargo.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_LR_Special_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\landrover\gunner02.002",
            "proxy:\a3\data_f\proxies\driver_high01\driver.001",
            "proxy:\a3\data_f\proxies\passenger_generic01_foldhands\cargo.006",
            "proxy:\a3\data_f\proxies\passenger_generic01_foldhands\cargo.005",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic02\cargo.004",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic03\cargo.003",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic02\cargo.002",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic02\cargo.001",
            "proxy:\a3\data_f\proxies\passenger_generic01_foldhands\cargo.007"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_T810_Unarmed_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\truck\cargo01.001",
            "proxy:\ca\temp\proxies\truck\cargo01.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_FV510_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\abrams\commander.001",
            "proxy:\ca\temp\proxies\abrams\gunner.001",
            "proxy:\ca\temp\proxies\abrams\driver.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_MCV80_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\abrams\commander.001",
            "proxy:\ca\temp\proxies\abrams\gunner.001",
            "proxy:\ca\temp\proxies\abrams\driver.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_B_BAF_Coyote_GMG_D", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\a3\data_f\proxies\hemtt\driver.001",
            "proxy:\a3\data_f\proxies\gunner_static_low01\gunner.002",
            "proxy:\a3\data_f\proxies\passenger_hunter_back\cargo01.001",
            "proxy:\a3\data_f\proxies\passenger_hunter_back\cargo01.002",
            "proxy:\a3\data_f\proxies\passenger_hunter_back\cargo01.007",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic03\cargo.008",
            "proxy:\a3\data_f\proxies\passenger_flatground_crosslegs\cargo.009"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_B_BAF_Coyote_L2A1_D", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\a3\data_f\proxies\hemtt\driver.001",
            "proxy:\a3\data_f\proxies\gunner_static_low01\gunner.002",
            "proxy:\a3\data_f\proxies\passenger_hunter_back\cargo01.001",
            "proxy:\a3\data_f\proxies\passenger_hunter_back\cargo01.002",
            "proxy:\a3\data_f\proxies\passenger_hunter_back\cargo01.007",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic03\cargo.008",
            "proxy:\a3\data_f\proxies\passenger_flatground_crosslegs\cargo.009"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_BAF_Jackal2_GMG_D", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\a3\data_f\proxies\hemtt\driver.001",
            "proxy:\a3\data_f\proxies\gunner_static_low01\gunner.002",
            "proxy:\a3\data_f\proxies\passenger_hunter_back\cargo01.001",
            "proxy:\a3\data_f\proxies\passenger_hunter_back\cargo01.002",
            "proxy:\a3\data_f\proxies\passenger_hunter_back\cargo01.007",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic03\cargo.008"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_BAF_Jackal2_L2A1_D", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\a3\data_f\proxies\hemtt\driver.001",
            "proxy:\a3\data_f\proxies\gunner_static_low01\gunner.002",
            "proxy:\a3\data_f\proxies\passenger_hunter_back\cargo01.001",
            "proxy:\a3\data_f\proxies\passenger_hunter_back\cargo01.002",
            "proxy:\a3\data_f\proxies\passenger_hunter_back\cargo01.007",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic03\cargo.008"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_MTVR_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\truck\cargo01.001",
            "proxy:\ca\temp\proxies\truck\cargo01.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_MTVR_Reammo_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\mtvr\driver.001",
            "proxy:\ca\temp\proxies\truck\cargo01.001",
            "proxy:\ca\temp\proxies\truck\cargo01.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_MTVR_Refuel_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\mtvr\driver.001",
            "proxy:\ca\temp\proxies\truck\cargo01.001",
            "proxy:\ca\temp\proxies\truck\cargo01.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_MTVR_Repair_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\mtvr\driver.001",
            "proxy:\ca\temp\proxies\truck\cargo01.001",
            "proxy:\ca\temp\proxies\truck\cargo01.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_MH47E_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\mi17\cargo02.001",
            "proxy:\ca\temp\proxies\mi17\cargo02.003",
            "proxy:\ca\temp\proxies\mi17\cargo02.002",
            "proxy:\ca\temp\proxies\mi17\cargo02.004",
            "proxy:\ca\temp\proxies\mi17\cargo02.005",
            "proxy:\ca\temp\proxies\mi17\cargo02.006",
            "proxy:\ca\temp\proxies\mi17\cargo02.007",
            "proxy:\ca\temp\proxies\mi17\cargo02.008",
            "proxy:\ca\temp\proxies\mi17\cargo02.009",
            "proxy:\ca\temp\proxies\mi17\cargo02.010",
            "proxy:\ca\temp\proxies\mi17\cargo02.011",
            "proxy:\ca\temp\proxies\mi17\cargo02.012",
            "proxy:\ca\temp\proxies\mi17\cargo02.013",
            "proxy:\ca\temp\proxies\mi17\cargo02.014",
            "proxy:\ca\temp\proxies\mi17\cargo02.015",
            "proxy:\ca\temp\proxies\mi17\cargo02.016",
            "proxy:\ca\temp\proxies\mi17\cargo02.017",
            "proxy:\ca\temp\proxies\mi17\cargo02.018",
            "proxy:\ca\temp\proxies\mi17\cargo02.019",
            "proxy:\ca\temp\proxies\mi17\cargo02.020",
            "proxy:\ca\temp\proxies\mi17\cargo02.021",
            "proxy:\ca\temp\proxies\mi17\cargo02.022",
            "proxy:\ca\temp\proxies\uh_60\pilot.001",
            "proxy:\ca\temp\proxies\mi17\cargo02.023",
            "proxy:\ca\temp\proxies\mi17\cargo02.024",
            "proxy:gunner.003",
            "proxy:gunner.002"
        ]];
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:gunner.004",
            "proxy:gunner.005"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_CH47F_VIV_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:\ca\temp\proxies\ch47\gunner.003"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_SA330_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\ch47\pilot.001",
            "proxy:\ca\temp\proxies\landrover\cargo.009",
            "proxy:\ca\temp\proxies\landrover\cargo.010",
            "proxy:\ca\temp\proxies\landrover\cargo.001",
            "proxy:\ca\temp\proxies\landrover\cargo.002",
            "proxy:\ca\temp\proxies\landrover\cargo.003",
            "proxy:\ca\temp\proxies\landrover\cargo.004",
            "proxy:\ca\temp\proxies\landrover\cargo.005",
            "proxy:\ca\temp\proxies\landrover\cargo.006",
            "proxy:\ca\temp\proxies\landrover\cargo.007",
            "proxy:\ca\temp\proxies\landrover\cargo.008",
            "proxy:\ca\temp\proxies\landrover\cargo.011",
            "proxy:\ca\temp\proxies\landrover\cargo.012",
            "proxy:\ca\temp\proxies\mi35\gunner.001",
            "proxy:\ca\temp\proxies\landrover\cargo.014",
            "proxy:\ca\temp\proxies\landrover\cargo.013"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_GR9_DYN_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\av8b\pilot.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_CH53E_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\uh_60\pilot.001",
            "proxy:\a3\data_f\proxies\heli_light_01\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_M2StaticMG_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\m2\gunner.01"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_RHIB_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\rhib\driver.001",
            "proxy:\a3\data_f\proxies\gunner_standup01\gunner.001",
            "proxy:\a3\data_f\proxies\gunner_standup01\gunner.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_M163_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\m163\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_B_MV22_USMC", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:\ca\temp\proxies\ch47\gunner.002"
        ]];
    }, true, ["CUP_B_MV22_USMC_RAMPGUN"], true] call CBA_fnc_addClassEventHandler;

    ["CUP_MH60S_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\mh60\gunner.002",
            "proxy:\ca\temp\proxies\mh60\gunner.001",
            "proxy:\ca\temp\proxies\uh1y\cargo02.002",
            "proxy:\ca\temp\proxies\uh1y\cargo01.003",
            "proxy:\ca\temp\proxies\uh1y\cargo01.004",
            "proxy:\ca\temp\proxies\uh_60\gunner.003",
            "proxy:\ca\temp\proxies\uh1y\cargo01.005",
            "proxy:\ca\temp\proxies\uh_60\cargo02.010",
            "proxy:\ca\temp\proxies\uh_60\cargo02.011",
            "proxy:\ca\temp\proxies\uh_60\pilot.001",
            "proxy:\ca\temp\proxies\uh_60\cargo02.012",
            "proxy:\ca\temp\proxies\uh_60\cargo02.013",
            "proxy:\ca\temp\proxies\uh_60\cargo02.006",
            "proxy:\ca\temp\proxies\uh_60\cargo02.007",
            "proxy:\ca\temp\proxies\uh_60\cargo02.008",
            "proxy:\ca\temp\proxies\uh_60\cargo02.009"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_M1_Abrams_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\abrams\commander.001",
            "proxy:\ca\temp\proxies\abrams\driver.001",
            "proxy:\ca\temp\proxies\abrams\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_M60A3_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:driverout.001",
            "proxy:commanderout.001",
            "proxy:gunnerout.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_Stinger_AA_pod_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\m2\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_TOW_TriPod_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\tow\gunner.01"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_MK19_TriPod_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\lowtripod\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_SearchLight_static_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\searchlight\gunner.01"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

};
