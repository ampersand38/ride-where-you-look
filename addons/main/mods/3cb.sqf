if (isClass (configFile >> "CfgPatches" >> "UK3CB_BAF_Vehicles")) then {

    ["UK3CB_BAF_Coyote_Logistics_L111A1_D", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic01\cargo.005",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic01\cargo.006",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic01\cargo.007",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic01\cargo.008",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic01\cargo.009",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic01\cargo.004"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["UK3CB_BAF_Coyote_Logistics_L134A1_D", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic01\cargo.005",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic01\cargo.006",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic01\cargo.007",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic01\cargo.008",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic01\cargo.009",
            "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic01\cargo.004"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["UK3CB_BAF_Coyote_Passenger_L111A1_D", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\passenger_low01\cargo.003"
        ]];
    }, true, ["UK3CB_BAF_Coyote_Logistics_L111A1_D"], true] call CBA_fnc_addClassEventHandler;

    ["UK3CB_BAF_Coyote_Passenger_L134A1_D", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\passenger_low01\cargo.003"
        ]];
        
    }, true, ["UK3CB_BAF_Coyote_Logistics_L134A1_D"], true] call CBA_fnc_addClassEventHandler;

    ["UK3CB_BAF_Husky_Logistics_GMG_Green", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\passenger_apc_generic01\cargo.003",
            "proxy:\a3\data_f\proxies\passenger_apc_generic01\cargo.004",
            "proxy:\a3\data_f\proxies\passenger_apc_generic01\cargo.005"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["UK3CB_BAF_Merlin_HC3_18", "init", {
        (_this select 0) setVariable ["RWYL_cargoProxyIndexes", [
            1,2,3,8,24,23,20,19,9 ,10,11,12,18,17,16,15
        ]];
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.004",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.005",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.006",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.007",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.021",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.022",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.025",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.026",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.027",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.028",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.029",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.030",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.031",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.032",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.033",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.034"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["UK3CB_BAF_Merlin_HC3_18_GPMG", "init", {
        (_this select 0) setVariable ["RWYL_cargoProxyIndexes", [
            1,2,3,8,24,23,20,19,9,10,11,12,18,17,16,15,35,36
        ]];
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.004",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.005",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.006",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.007",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.013",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.014",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.021",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.022",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.025",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.026",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.027",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.028",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.029",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.030",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.031",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.032",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.033",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.034"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["UK3CB_BAF_Merlin_HC3_24", "init", {
        (_this select 0) setVariable ["RWYL_cargoProxyIndexes", [
            1,2,3,4,24,23,22,21,5,6,7,8,20,19,18,17,9,10,11,12,16,15
        ]];
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.025",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.026",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.027",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.028",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.029",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.030",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.031",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.032",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.033",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.034",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.035",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.036"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["UK3CB_BAF_Merlin_HC3_32", "init", {
        (_this select 0) setVariable ["RWYL_cargoProxyIndexes", [
            1,2,3,4,24,23,22,21,5,6,7,8,20,19,18,17,9,10,11,12,16,15,14,13,25,26,27,28,29,30,31,32
        ]];
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.033",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.034",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.035",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.036"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["UK3CB_BAF_Merlin_HC3_Cargo", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.002",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.008",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.024",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.017",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.018",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.003",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.015",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.001",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.023",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.020",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.009",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.011",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.010",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.014",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.016",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.019",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.005",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.006",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.004",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.007",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.012",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.013",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.021",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.022",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.026",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.025",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.027",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.028",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.029",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.030",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.031",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.032"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["UK3CB_BAF_Merlin_HC3_CSAR", "init", {
        (_this select 0) setVariable ["RWYL_cargoProxyIndexes", [
            33,34,35,36,1,2,3,8,24,23,20,19
        ]];
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.004",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.005",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.006",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.007",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.009",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.011",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.010",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.012",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.015",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.016",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.017",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.018",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.021",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.022",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.025",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.026",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.027",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.028",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.029",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.030",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.031",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.032"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
};
