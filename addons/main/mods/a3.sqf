["LSV_01_armed_base_F", "init", {
    (_this select 0) setVariable ["RWYL_proxyExcludeList", [
        "proxy:\a3\data_f\proxies\passenger_low01\cargo.004",
        "proxy:\a3\data_f\proxies\passenger_low01\cargo.005",
        "proxy:\a3\data_f\proxies\gunner_standup01\cargo.006"
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["LSV_01_AT_base_F", "init", {
    (_this select 0) setVariable ["RWYL_proxyExcludeList", [
        "proxy:\a3\data_f\proxies\passenger_low01\cargo.004",
        "proxy:\a3\data_f\proxies\passenger_low01\cargo.005",
        "proxy:\a3\data_f\proxies\gunner_standup01\cargo.006"
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["B_T_VTOL_01_vehicle_F", "init", {
    (_this select 0) setVariable ["RWYL_proxyExcludeList", [
        "proxy:\a3\data_f\proxies\passenger_apc_generic04\cargo.003",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo.004",
        "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic02\cargo.005",
        "proxy:\a3\data_f\proxies\passenger_apc_generic01\cargo.006",
        "proxy:\a3\data_f\proxies\passenger_apc_generic04\cargo.007",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo.008",
        "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic02\cargo.009",
        "proxy:\a3\data_f\proxies\passenger_apc_generic01\cargo.010",
        "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic01\cargo.011",
        "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic03\cargo.012",
        "proxy:\a3\data_f\proxies\passenger_apc_generic04\cargo.013",
        "proxy:\a3\data_f\proxies\passenger_apc_generic01\cargo.014",
        "proxy:\a3\data_f\proxies\passenger_apc_generic03\cargo.015",
        "proxy:\a3\data_f\proxies\passenger_generic01_foldhands\cargo.016",
        "proxy:\a3\data_f\proxies\passenger_apc_generic03\cargo.017",
        "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic03\cargo.018",
        "proxy:\a3\data_f\proxies\passenger_apc_generic02\cargo.019",
        "proxy:\a3\data_f\proxies\passenger_apc_generic03\cargo.020",
        "proxy:\a3\data_f\proxies\passenger_apc_generic04\cargo.021",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo.022",
        "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic02\cargo.023",
        "proxy:\a3\data_f\proxies\passenger_apc_generic01\cargo.024",
        "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic01\cargo.025",
        "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic03\cargo.026",
        "proxy:\a3\data_f\proxies\passenger_apc_generic04\cargo.027",
        "proxy:\a3\data_f\proxies\passenger_apc_generic01\cargo.028",
        "proxy:\a3\data_f\proxies\passenger_apc_generic03\cargo.029",
        "proxy:\a3\data_f\proxies\passenger_generic01_foldhands\cargo.030",
        "proxy:\a3\data_f\proxies\passenger_apc_generic03\cargo.031",
        "proxy:\a3\data_f\proxies\passenger_apc_narrow_generic03\cargo.032",
        "proxy:\a3\data_f\proxies\passenger_apc_generic02\cargo.033",
        "proxy:\a3\data_f\proxies\passenger_apc_generic03\cargo.034"
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["O_T_VTOL_02_vehicle_dynamicLoadout_F", "init", {
    (_this select 0) setVariable ["RWYL_proxyExcludeList", [
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.001",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.002",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.003",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.004",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.005",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.006",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.007",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.008",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.009",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.010",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.011",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.012",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.013",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.014",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.015",
        "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.016"
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Mortar_01_base_F", "init", {
    (_this select 0) setVariable ["RWYL_proxyExcludeList", [
        "proxy:\a3\data_f\proxies\mortar_01\cargo.001"
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["B_Truck_01_transport_F", "init", {
    (_this select 0) setVariable ["RWYL_cargoProxyIndexes", [
        1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["O_Truck_03_transport_F", "init", {
    (_this select 0) setVariable ["RWYL_cargoProxyIndexes", [
        1,2,3,4,5,6,7,8,9,10,11,12,13
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Offroad_01_armed_base_F", "init", {
    (_this select 0) setVariable ["RWYL_proxyExcludeList", [
        "proxy:\a3\data_f\proxies\passenger_flatground_leanright\cargo.003",
        "proxy:\a3\data_f\proxies\passenger_flatground_crosslegs\cargo.004",
        "proxy:\a3\data_f\proxies\passenger_flatground_leanleft\cargo.005"
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Van_02_vehicle_base_F", "init", {
    (_this select 0) setVariable ["RWYL_proxyExcludeList", [
        "proxy:\a3\data_f\proxies\passenger_flatground_crosslegs\cargo.002",
        "proxy:\a3\data_f\proxies\passenger_flatground_crosslegs\cargo.003",
        "proxy:\a3\data_f\proxies\passenger_flatground_crosslegs\cargo.004",
        "proxy:\a3\data_f\proxies\passenger_flatground_crosslegs\cargo.005",
        "proxy:\a3\data_f\proxies\passenger_flatground_crosslegs\cargo.006",
        "proxy:\a3\data_f\proxies\passenger_flatground_crosslegs\cargo.007",
        "proxy:\a3\data_f\proxies\passenger_flatground_crosslegs\cargo.008",
        "proxy:\a3\data_f\proxies\passenger_flatground_crosslegs\cargo.009",
        "proxy:\a3\data_f\proxies\passenger_flatground_crosslegs\cargo.010"
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;

// Hellcat
["Heli_Light_03_base_F", "init", {
    (_this select 0) setVariable ["RWYL_cargoProxyIndexes", [
        1,2,3,4,5,6
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Heli_Light_01_civil_base_F", "init", {
    (_this select 0) setVariable ["RWYL_proxyExcludeList", [
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.001",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.002",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.004",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.003"
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Heli_Light_01_armed_base_F", "init", {
    (_this select 0) setVariable ["RWYL_proxyExcludeList", [
        "proxy:\a3\data_f\proxies\heli_light_01\cargo01.001",
        "proxy:\a3\data_f\proxies\heli_light_01\cargo01.002",
        "proxy:\a3\data_f\proxies\heli_light_01\cargo01.004",
        "proxy:\a3\data_f\proxies\heli_light_01\cargo01.003"
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Heli_Transport_03_base_F", "init", {
    (_this select 0) setVariable ["RWYL_proxyExcludeList", [
        "proxy:\a3\data_f\proxies\heli_transport_01\gunner.004",
        "proxy:\a3\data_f\proxies\heli_transport_01\gunner.005"
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Heli_Transport_03_unarmed_base_F", "init", {
    (_this select 0) setVariable ["RWYL_proxyExcludeList", [
        "proxy:\a3\data_f\proxies\heli_transport_01\gunner.002",
        "proxy:\a3\data_f\proxies\heli_transport_01\gunner.001"
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Truck_02_MRL_base_F", "init", {
    (_this select 0) setVariable ["RWYL_proxyIncludeList", [
        "proxy:gunner.001"
    ]];
}, true, [], true] call CBA_fnc_addClassEventHandler;
