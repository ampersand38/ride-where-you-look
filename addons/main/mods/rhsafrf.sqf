if (isClass (configFile >> "CfgPatches" >> "rhs_main")) then {
    ["rhs_btr60_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyWhitelist", [
            "proxy:gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_D30_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyWhitelist", [
            "proxy:gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_Ural_BaseTurret", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\truck\cargo01.001",
            "proxy:\ca\temp\proxies\uaz\driver.001",
            "proxy:\ca\temp\proxies\truck\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_UAZ_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyWhitelist", [
            "proxy:\ca\temp\proxies\uaz\driver.001"
        ]];
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\uaz\cargo01.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_tigr_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\uaz\cargo01.001",
            "proxy:cargo01.008",
            "proxy:cargo02.001"
        ]];
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:gunner02.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_bmp_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyWhitelist", [
            "proxy:\ca\temp\proxies\bmp2\driver.001"
        ]];
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:commander.001",
            "proxy:gunner.001"
        ]];
    }, true, ["rhs_bmp1d_vdv", "rhs_bmp1k_vdv", "rhs_bmp1p_vdv", "rhs_bmp2e_vdv", "rhs_prp3_vdv"], true] call CBA_fnc_addClassEventHandler;

    ["rhs_bmp1d_vdv", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\bmp2\driver.001",
            "proxy:commander.001",
            "proxy:gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_bmp1k_vdv", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\bmp2\driver.001",
            "proxy:commander.001",
            "proxy:gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_bmp1p_vdv", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\bmp2\driver.001",
            "proxy:commander.001",
            "proxy:gunner.001"
        ]];
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:gunner.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_prp3_vdv", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:commander.001",
            "proxy:gunner.002",
            "proxy:gunner.001",
            "proxy:gunner.003"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_gaz66_vmf", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\uaz\driver.001",
            "proxy:\ca\temp\proxies\truck\cargo.001"
        ]];
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:cargo02.023",
            "proxy:cargo04.024"
        ]];
    }, true, ["rhs_gaz66_flat_vmf", "rhs_gaz66o_flat_vmf", "rhs_gaz66_zu23_base"], true] call CBA_fnc_addClassEventHandler;

    ["rhs_gaz66_flat_vmf", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\uaz\driver.001",
            "proxy:\ca\temp\proxies\truck\cargo.001"
        ]];
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:cargo02.023",
            "proxy:cargo04.024",
            "proxy:\ca\temp\proxies\truck\cargo.013",
            "proxy:\ca\temp\proxies\truck\cargo.011",
            "proxy:\ca\temp\proxies\truck\cargo.010",
            "proxy:\ca\temp\proxies\truck\cargo.002",
            "proxy:\ca\temp\proxies\truck\cargo.012",
            "proxy:\ca\temp\proxies\truck\cargo.008",
            "proxy:\ca\temp\proxies\truck\cargo.003",
            "proxy:\ca\temp\proxies\truck\cargo.005",
            "proxy:\ca\temp\proxies\truck\cargo.004",
            "proxy:\ca\temp\proxies\truck\cargo.006",
            "proxy:\ca\temp\proxies\truck\cargo.007",
            "proxy:\ca\temp\proxies\truck\cargo.009"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_gaz66o_flat_vmf", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\uaz\driver.001",
            "proxy:\ca\temp\proxies\truck\cargo.001"
        ]];
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:cargo02.023",
            "proxy:cargo04.024",
            "proxy:\ca\temp\proxies\truck\cargo.013",
            "proxy:\ca\temp\proxies\truck\cargo.011",
            "proxy:\ca\temp\proxies\truck\cargo.010",
            "proxy:\ca\temp\proxies\truck\cargo.002",
            "proxy:\ca\temp\proxies\truck\cargo.012",
            "proxy:\ca\temp\proxies\truck\cargo.008",
            "proxy:\ca\temp\proxies\truck\cargo.003",
            "proxy:\ca\temp\proxies\truck\cargo.005",
            "proxy:\ca\temp\proxies\truck\cargo.004",
            "proxy:\ca\temp\proxies\truck\cargo.006",
            "proxy:\ca\temp\proxies\truck\cargo.007",
            "proxy:\ca\temp\proxies\truck\cargo.009"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_gaz66_zu23_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\basiccrew\gunner.001",
            "proxy:\ca\temp\proxies\basiccrew\cargo.003",
            "proxy:cargo02.004",
            "proxy:\ca\temp\proxies\uaz\driver.001",
            "proxy:\ca\temp\proxies\truck\cargo.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_ZU23_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:cargo01.001"
        ]];
        (_this select 0) setVariable ["RWYL_proxyWhitelist", [
            "proxy:\ca\temp\proxies\basiccrew\gunner.01"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_nsv_tripod_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\kord\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_KORD_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyWhitelist", [
            "proxy:\ca\temp\proxies\kord\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_Metis_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyWhitelist", [
            "proxy:\ca\temp\proxies\metis\gunner.01"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_Igla_AA_pod_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyWhitelist", [
            "proxy:\ca\temp\proxies\basiccrew\gunner.01"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_2s3tank_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:commander.001",
            "proxy:gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_2s1tank_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:commander.001",
            "proxy:gunner.001",
            "proxy:commander.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_a3t72tank_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:commander.002"
        ]];
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\t72\driver.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_t80b", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:commander.002"
        ]];
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:driver.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_bmk_t_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyWhitelist", [
            "proxy:\a3\data_f\proxies\fishing_boat\driver.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_zsutank_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyWhitelist", [
            "proxy:\ca\temp\proxies\zsu\gunner.01"
        ]];
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\bmp2\driver.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_p37_turret_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyWhitelist", [
            "proxy:\ca\temp\proxies\metis\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_kamaz5350", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:cargo02.023",
            "proxy:cargo04.024"
        ]];
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.002",
            "proxy:driver.001",
            "proxy:cargo03.001"
        ]];
    }, true, ["rhs_kamaz5350_flatbed"], true] call CBA_fnc_addClassEventHandler;

    ["rhs_kamaz5350_flatbed", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:cargo02.023",
            "proxy:cargo04.024",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.004",
            "proxy:\a3\data_f\proxies\passenger_generic01_foldhands\cargo01.006",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.007",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.012",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.014",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.008",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.010",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.016",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.003",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.009",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.005",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.011",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.013",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.015"
        ]];
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.002",
            "proxy:cargo03.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_Ural_Flat_MSV_01", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:\ca\temp\proxies\truck\cargo02.013",
            "proxy:\ca\temp\proxies\truck\cargo02.012",
            "proxy:\ca\temp\proxies\truck\cargo04.003",
            "proxy:\ca\temp\proxies\truck\cargo04.014",
            "proxy:\ca\temp\proxies\truck\cargo01.010",
            "proxy:\ca\temp\proxies\truck\cargo01.005",
            "proxy:\ca\temp\proxies\truck\cargo02.007",
            "proxy:\ca\temp\proxies\truck\cargo01.004",
            "proxy:\ca\temp\proxies\truck\cargo04.006",
            "proxy:\ca\temp\proxies\truck\cargo02.008",
            "proxy:\ca\temp\proxies\truck\cargo04.009",
            "proxy:\ca\temp\proxies\truck\cargo01.011"
        ]];
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\uaz\driver.001",
            "proxy:\ca\temp\proxies\truck\cargo01.001",
            "proxy:\ca\temp\proxies\truck\cargo01.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_Ural_Open_Flat_MSV_01", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:\ca\temp\proxies\truck\cargo02.013",
            "proxy:\ca\temp\proxies\truck\cargo02.012",
            "proxy:\ca\temp\proxies\truck\cargo04.003",
            "proxy:\ca\temp\proxies\truck\cargo04.014",
            "proxy:\ca\temp\proxies\truck\cargo01.010",
            "proxy:\ca\temp\proxies\truck\cargo01.005",
            "proxy:\ca\temp\proxies\truck\cargo02.007",
            "proxy:\ca\temp\proxies\truck\cargo01.004",
            "proxy:\ca\temp\proxies\truck\cargo04.006",
            "proxy:\ca\temp\proxies\truck\cargo02.008",
            "proxy:\ca\temp\proxies\truck\cargo04.009",
            "proxy:\ca\temp\proxies\truck\cargo01.011",
            "proxy:cargo02.023",
            "proxy:cargo04.024"
        ]];
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\uaz\driver.001",
            "proxy:\ca\temp\proxies\truck\cargo01.001",
            "proxy:\ca\temp\proxies\truck\cargo01.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_zil131_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\truck\cargo01.001",
            "proxy:\ca\temp\proxies\truck\cargo01.002"
        ]];
    }, true, ["rhs_zil131_flatbed_base"], true] call CBA_fnc_addClassEventHandler;

    ["rhs_zil131_flatbed_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:\ca\temp\proxies\truck\cargo04.003",
            "proxy:\ca\temp\proxies\truck\cargo01.005",
            "proxy:\ca\temp\proxies\truck\cargo02.007",
            "proxy:\ca\temp\proxies\truck\cargo01.004",
            "proxy:\ca\temp\proxies\truck\cargo04.006",
            "proxy:\ca\temp\proxies\truck\cargo02.008",
            "proxy:\ca\temp\proxies\truck\cargo02.011",
            "proxy:\ca\temp\proxies\truck\cargo02.010",
            "proxy:\ca\temp\proxies\truck\cargo04.012",
            "proxy:\ca\temp\proxies\truck\cargo01.009"
        ]];
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\truck\cargo01.001",
            "proxy:\ca\temp\proxies\truck\cargo01.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
};
