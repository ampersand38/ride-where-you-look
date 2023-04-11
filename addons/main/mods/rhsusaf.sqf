if (isClass (configFile >> "CfgPatches" >> "rhsusf_main")) then {

    ["RHS_M119_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyIncludeList", [
            "proxy:gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_M252_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyIncludeList", [
            "proxy:\a3\data_f\proxies\mortar\cargo.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhsusf_m998_w_2dr", "init", {

        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:cargo01.008",
            "2drcargocomplete",
            "2drcargo"
        ]];
    }, true, ["rhsusf_m998_w_4dr"], true] call CBA_fnc_addClassEventHandler;

    ["rhsusf_m998_w_4dr", "init", {

        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:cargo01.006",
            "proxy:\ca\temp\proxies\skodovka\cargo.007",
            "proxy:\ca\temp\proxies\skodovka\cargo.008"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhsusf_m998_w_4dr_halftop", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:cargo01.006",
            "proxy:\ca\temp\proxies\skodovka\cargo.007",
            "proxy:\ca\temp\proxies\skodovka\cargo.008"
        ]];
    }, true, ["rhsusf_m998_w_4dr_fulltop"], true] call CBA_fnc_addClassEventHandler;

    ["rhsusf_m998_w_4dr_fulltop", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\ca\temp\proxies\skodovka\cargo.004",
            "proxy:\ca\temp\proxies\skodovka\cargo.005",
            "proxy:cargo01.006",
            "proxy:\ca\temp\proxies\skodovka\cargo.007",
            "proxy:\ca\temp\proxies\skodovka\cargo.008"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhssaf_m1152_olive", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\ca\temp\proxies\skodovka\cargo.005",
            "proxy:\ca\temp\proxies\skodovka\cargo.002",
            "proxy:\ca\temp\proxies\skodovka\cargo.007",
            "proxy:\ca\temp\proxies\skodovka\cargo.004",
            "proxy:\ca\temp\proxies\skodovka\cargo.003",
            "proxy:\ca\temp\proxies\skodovka\cargo.006"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhssaf_m1152_rsv_olive", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\ca\temp\proxies\skodovka\cargo.005",
            "proxy:\ca\temp\proxies\skodovka\cargo.002",
            "proxy:\ca\temp\proxies\skodovka\cargo.007",
            "proxy:\ca\temp\proxies\skodovka\cargo.004",
            "proxy:\ca\temp\proxies\skodovka\cargo.003",
            "proxy:\ca\temp\proxies\skodovka\cargo.006"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_CH_47F_base", "init", {
        (_this select 0) setVariable ["RWYL_cargoProxyIndexes", [
            1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,2,25
        ]];
    }, true, ["RHS_CH_47F_cargo_base"], true] call CBA_fnc_addClassEventHandler;

    ["RHS_CH_47F_cargo_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\ca\temp\proxies\ch47\cargo01.014",
            "proxy:\ca\temp\proxies\ch47\cargo02.003",
            "proxy:\ca\temp\proxies\ch47\cargo03.004",
            "proxy:\ca\temp\proxies\ch47\cargo01.005",
            "proxy:\ca\temp\proxies\ch47\cargo03.006",
            "proxy:\ca\temp\proxies\ch47\cargo02.007",
            "proxy:\ca\temp\proxies\ch47\cargo01.008",
            "proxy:\ca\temp\proxies\ch47\cargo03.009",
            "proxy:\ca\temp\proxies\ch47\cargo01.002",
            "proxy:\ca\temp\proxies\ch47\cargo02.010",
            "proxy:\ca\temp\proxies\ch47\cargo03.011",
            "proxy:\ca\temp\proxies\ch47\cargo02.012",
            "proxy:\ca\temp\proxies\ch47\cargo03.013",
            "proxy:\ca\temp\proxies\ch47\cargo02.015",
            "proxy:\ca\temp\proxies\ch47\cargo01.016",
            "proxy:\ca\temp\proxies\ch47\cargo03.017",
            "proxy:\ca\temp\proxies\ch47\cargo02.018",
            "proxy:\ca\temp\proxies\ch47\cargo01.019",
            "proxy:\ca\temp\proxies\ch47\cargo03.020",
            "proxy:\ca\temp\proxies\ch47\cargo02.021",
            "proxy:\ca\temp\proxies\ch47\cargo01.022",
            "proxy:\ca\temp\proxies\ch47\cargo03.023",
            "proxy:\ca\temp\proxies\ch47\cargo02.001",
            "proxy:\ca\temp\proxies\ch47\cargo01.025"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_M2A2_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyIncludeList", [
            "proxy:\ca\temp\proxies\m2a2_bredlay\driver.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhsusf_M1117_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:gunner.003"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhsusf_m1a1tank_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\ca\temp\proxies\abrams\commander.002"
        ]];

    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_MK19_TriPod_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyIncludeList", [
            "proxy:\ca\temp\proxies\lowtripod\gunner.01"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhs_m2staticmg_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyIncludeList", [
            "proxy:gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_MELB_H6M", "init", {

        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.003",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.004",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.005",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.006",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.007",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.008",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.010"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_MELB_MH6M", "init", {

        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.001",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.002",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.010"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_MELB_AH6M", "init", {

        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.001",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.002",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.003",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.004",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.005",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.006",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.007",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.008",
            "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo.009"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhsusf_f22", "init", {
        (_this select 0) setVariable ["RWYL_proxyIncludeList", [
            "proxy:\ca\temp\proxies\a10\pilot.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_C130J_Cargo_Base", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\ca\temp\proxies\mi17\cargo.003",
            "proxy:\ca\temp\proxies\mi17\cargo.004",
            "proxy:\ca\temp\proxies\mi17\cargo.005",
            "proxy:\ca\temp\proxies\mi17\cargo.006",
            "proxy:\ca\temp\proxies\mi17\cargo.007",
            "proxy:\ca\temp\proxies\mi17\cargo.008",
            "proxy:\ca\temp\proxies\mi17\cargo.009",
            "proxy:\ca\temp\proxies\mi17\cargo.010",
            "proxy:\ca\temp\proxies\mi17\cargo.011",
            "proxy:\ca\temp\proxies\mi17\cargo.012",
            "proxy:\ca\temp\proxies\mi17\cargo.013",
            "proxy:\ca\temp\proxies\mi17\cargo.014",
            "proxy:\ca\temp\proxies\mi17\cargo.015",
            "proxy:\ca\temp\proxies\mi17\cargo.016",
            "proxy:\ca\temp\proxies\mi17\cargo.017",
            "proxy:\ca\temp\proxies\mi17\cargo.018",
            "proxy:\ca\temp\proxies\mi17\cargo.019",
            "proxy:\ca\temp\proxies\mi17\cargo.020",
            "proxy:\ca\temp\proxies\mi17\cargo.021",
            "proxy:\ca\temp\proxies\mi17\cargo.022",
            "proxy:\ca\temp\proxies\mi17\cargo.023",
            "proxy:\ca\temp\proxies\mi17\cargo.024",
            "proxy:\ca\temp\proxies\mi17\cargo.025",
            "proxy:\ca\temp\proxies\mi17\cargo.002"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["rhsusf_CH53E_USMC", "init", {

        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\ca\temp\proxies\lowtripod\gunner.002"
        ]];
    }, true, ["rhsusf_CH53E_USMC_GAU21"], true] call CBA_fnc_addClassEventHandler;

    ["rhsusf_CH53e_USMC_cargo", "init", {

        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\ca\temp\proxies\uh_60\cargo01.001",
            "proxy:\ca\temp\proxies\uh_60\cargo01.002",
            "proxy:\ca\temp\proxies\uh_60\cargo01.003",
            "proxy:\ca\temp\proxies\uh_60\cargo01.004",
            "proxy:\ca\temp\proxies\uh_60\cargo01.005",
            "proxy:\ca\temp\proxies\uh_60\cargo01.006",
            "proxy:\ca\temp\proxies\uh_60\cargo01.007",
            "proxy:\ca\temp\proxies\uh_60\cargo01.008",
            "proxy:\ca\temp\proxies\uh_60\cargo01.009",
            "proxy:\ca\temp\proxies\uh_60\cargo01.010",
            "proxy:\ca\temp\proxies\uh_60\cargo01.011",
            "proxy:\ca\temp\proxies\uh_60\cargo01.012",
            "proxy:\ca\temp\proxies\uh_60\cargo01.013",
            "proxy:\ca\temp\proxies\uh_60\cargo01.014",
            "proxy:\ca\temp\proxies\uh_60\cargo01.015",
            "proxy:\ca\temp\proxies\uh_60\cargo01.016",
            "proxy:\ca\temp\proxies\uh_60\cargo01.017",
            "proxy:\ca\temp\proxies\uh_60\cargo01.018",
            "proxy:\ca\temp\proxies\uh_60\cargo01.019",
            "proxy:\ca\temp\proxies\uh_60\cargo01.020",
            "proxy:\ca\temp\proxies\uh_60\cargo01.021",
            "proxy:\ca\temp\proxies\uh_60\cargo01.022",
            "proxy:\ca\temp\proxies\uh_60\cargo01.023",
            "proxy:\ca\temp\proxies\uh_60\cargo01.024",
            "proxy:\ca\temp\proxies\lowtripod\gunner.002"
        ]];
    }, true, ["rhsusf_CH53E_USMC_GAU21"], true] call CBA_fnc_addClassEventHandler;

    ["RHS_UH1Y", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\ca\temp\proxies\uh1y\cargo01.008",
            "proxy:\ca\temp\proxies\uh1y\cargo01.009"
        ]];
    }, false, [], true] call CBA_fnc_addClassEventHandler;

    ["RHS_UH1Y_d", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\ca\temp\proxies\uh1y\cargo01.008",
            "proxy:\ca\temp\proxies\uh1y\cargo01.009"
        ]];
    }, false, [], true] call CBA_fnc_addClassEventHandler;

};
