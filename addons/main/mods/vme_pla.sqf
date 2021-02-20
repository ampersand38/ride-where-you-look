if (isClass (configFile >> "CfgPatches" >> "VME_PLA_WHEELED_C")) then {

    GVAR(offset_proxies) append [
        "proxy:\ca\temp\proxies\uaz\cargo01.01",
        "proxy:\ca\temp\proxies\hmmwv\driver.01",
        "proxy:\ca\temp\proxies\truck\driver.001",
        "proxy:\ca\temp\proxies\truck\cargo01.001",
        "proxy:\ca\temp\proxies\bmp2\commander.001",
        "proxy:\ca\temp\proxies\bmp2\gunner.001",
        "proxy:\ca\temp\proxies\bmp2\driver.001"
    ];

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
