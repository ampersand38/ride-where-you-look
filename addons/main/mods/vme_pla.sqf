if (isClass (configFile >> "CfgPatches" >> "VME_PLA_WHEELED_C")) then {

    ["rhs_zil131_flatbed_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyExcludeList", [
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
    }, true, [], true] call CBA_fnc_addClassEventHandler;

};
