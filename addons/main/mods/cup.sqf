if (isClass (configFile >> "CfgPatches" >> "CUP_Vehicles_Core")) then {

    ["CUP_Hilux_MLRS_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\ca\temp\proxies\hilux\cargo01.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_Hilux_UB32_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\ca\temp\proxies\hilux\cargo01.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_Kamaz_5350_ReAmmo_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
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

    ["CUP_ZSU23_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyIncludeList", [
            "proxy:\ca\temp\proxies\zsu\driver.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_MH47E_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:gunner.004",
            "proxy:gunner.005"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
    ["CUP_CH47F_VIV_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\ca\temp\proxies\ch47\gunner.003"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["CUP_B_MV22_USMC", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\ca\temp\proxies\ch47\gunner.002"
        ]];
    }, true, ["CUP_B_MV22_USMC_RAMPGUN"], true] call CBA_fnc_addClassEventHandler;

};
