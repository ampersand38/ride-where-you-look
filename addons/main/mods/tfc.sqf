if (isClass (configFile >> "CfgPatches" >> "tfc_rcaf_ch147")) then {
    ["CH147F_base_F", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.001",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.002",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.003",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.004",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.005",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.006",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.007",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.008",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.009",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.010",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.011",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.012",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.013",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.014",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.015",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.016",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.017",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.018",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.019",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.020",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.021",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.022",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.023",
            "proxy:\a3\data_f\proxies\heli_transport_01\cargo01.024"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
};
