class CfgVehicles {
    class LSV_01_base_F;
    class LSV_01_armed_base_F: LSV_01_base_F {
        RWYL_proxyBlacklist[] = {
            "proxy:\a3\data_f\proxies\passenger_low01\cargo.004",
            "proxy:\a3\data_f\proxies\passenger_low01\cargo.005"
        };
    };
    class LSV_01_AT_base_F: LSV_01_base_F {
        RWYL_proxyBlacklist[] = {
            "proxy:\a3\data_f\proxies\passenger_low01\cargo.004",
            "proxy:\a3\data_f\proxies\passenger_low01\cargo.005",
            "proxy:\a3\data_f\proxies\gunner_standup01\cargo.006"
        };
    };

    class VTOL_01_vehicle_base_F;
    class B_T_VTOL_01_vehicle_F: VTOL_01_vehicle_base_F {
        RWYL_proxyBlacklist[] = {
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo.001",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo.002",
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
        };
    };

    // class O_T_VTOL_02_vehicle_base_F;
    // class O_T_VTOL_02_vehicle_F: O_T_VTOL_02_vehicle_base_F {
    //     RWYL_proxyBlacklist[] = {
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.001",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.002",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.003",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.004",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.005",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.006",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.007",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.008",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.009",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.010",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.011",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.012",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.013",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.014",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.015",
    //         "proxy:\a3\data_f\proxies\passenger_generic01_leanleft\cargo01.016"
    //     };
    // };

    class VTOL_02_vehicle_dynamicLoadout_base_F;
    class O_T_VTOL_02_vehicle_dynamicLoadout_F: VTOL_02_vehicle_dynamicLoadout_base_F {
        RWYL_proxyBlacklist[] = {
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
        };
    };

    class StaticMortar;
    class Mortar_01_base_F: StaticMortar {
        RWYL_proxyBlacklist[] = {
            "proxy:\a3\data_f\proxies\mortar_01\cargo.001"
        };
    };

    class Helicopter_Base_H;
    class Heli_Light_01_base_F: Helicopter_Base_H {
        RWYL_proxyOffsets[] = {
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.001",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.002",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.004",
            "proxy:\a3\data_f\proxies\heli_light_01\cargo01.003"
        };
    };

    class Rubber_duck_base_F;
    class B_Boat_Transport_01_F: Rubber_duck_base_F {
        RWYL_proxyOffsets[] = {
            "proxy:\a3\data_f\proxies\rubber_boat\cargo02.002",
            "proxy:\a3\data_f\proxies\rubber_boat\cargo01.001",
            "proxy:\a3\data_f\proxies\rubber_boat\cargo03.003",
            "proxy:\a3\data_f\proxies\rubber_boat\cargo04.004",
            "proxy:\a3\data_f\proxies\rubber_boat\driver.001"
        };
    };

};

/*
_v = ([[curatorSelected # 0 # 0, [vehicle player, cursorObject] select (vehicle player == player)] select isNull curatorCamera, (get3DENSelected "" # 0 # 0)] select is3DEN);
private _sn = selectionNames v select {
    private _proxy = toLower _x;
    private _proxyIndex = _proxy select [(_proxy find ".") + 1];
    // has non-zero selection position
    !((_v selectionPosition _proxy) isEqualTo [0,0,0]) && {
    // ends with a number after a period
    ((parseNumber _proxyIndex > 0) || {_proxyIndex isEqualTo "0"}) && {
    // contains seat role
    (("cargo" in toLower _proxy) || {("gunner" in toLower _proxy) || {("driver" in toLower _proxy) ||
    {("commander" in toLower _proxy) || {("pilot" in toLower _proxy)}}}})}}
};
_sn joinString (toString [13,10])
*/
