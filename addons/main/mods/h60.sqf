if (isClass (configFile >> "CfgPatches" >> "vtx_uh60")) then {

    ["vtx_H60_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\m113\cargo02.001",
            "proxy:\ca\temp\proxies\m113\cargo02.002",
            "proxy:\ca\temp\proxies\m113\cargo03.003",
            "proxy:\ca\temp\proxies\m113\cargo02.004",
            "proxy:\ca\temp\proxies\m113\cargo02.005",
            "proxy:\ca\temp\proxies\m113\cargo02.006",
            "proxy:\ca\temp\proxies\m113\cargo03.007",
            "proxy:\ca\temp\proxies\m113\cargo03.008",
            "proxy:\ca\temp\proxies\m113\cargo03.009",
            "proxy:\ca\temp\proxies\m113\cargo02.010",
            "proxy:\ca\temp\proxies\m113\cargo03.011",
            "proxy:\ca\temp\proxies\m113\cargo03.012",
            "proxy:\ca\temp\proxies\m113\cargo03.013"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["vtx_UH60M", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:\ca\temp\proxies\m113\cargo03.012",
            "proxy:\ca\temp\proxies\m113\cargo03.013"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["vtx_MH60M", "init", {
        (_this select 0) setVariable ["RWYL_cargoProxyIndexes", [
            12,13,3,6,11
        ]];
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:\ca\temp\proxies\m113\cargo02.001",
            "proxy:\ca\temp\proxies\m113\cargo02.002",
            "proxy:\ca\temp\proxies\m113\cargo03.003",
            "proxy:\ca\temp\proxies\m113\cargo02.004",
            "proxy:\ca\temp\proxies\m113\cargo03.011",
            "proxy:\ca\temp\proxies\m113\cargo03.012"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["vtx_MH60S", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:\ca\temp\proxies\m113\cargo02.001",
            "proxy:\ca\temp\proxies\m113\cargo02.002",
            "proxy:\ca\temp\proxies\m113\cargo03.003",
            "proxy:\ca\temp\proxies\m113\cargo02.004",
            "proxy:\ca\temp\proxies\m113\cargo03.011",
            "proxy:\ca\temp\proxies\m113\cargo03.012"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["vtx_MH60S_GAU21L", "init", {
        (_this select 0) setVariable ["RWYL_cargoProxyIndexes", [
            12,13,3,6,11
        ]];
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            //"proxy:\ca\temp\proxies\m113\cargo02.001",
            //"proxy:\ca\temp\proxies\m113\cargo02.002",
            "proxy:\ca\temp\proxies\m113\cargo02.004",
            "proxy:\ca\temp\proxies\m113\cargo02.005",
            "proxy:\ca\temp\proxies\m113\cargo03.007",
            "proxy:\ca\temp\proxies\m113\cargo03.008",
            "proxy:\ca\temp\proxies\m113\cargo03.009",
            "proxy:\ca\temp\proxies\m113\cargo02.010"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["vtx_MH60S_Pylons", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:\ca\temp\proxies\m113\cargo03.012",
            "proxy:\ca\temp\proxies\m113\cargo03.013"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["vtx_MH60S_Pylons_GAU21L", "init", {
        (_this select 0) setVariable ["RWYL_cargoProxyIndexes", [
            12,13,3,6,11
        ]];
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            //"proxy:\ca\temp\proxies\m113\cargo02.001",
            //"proxy:\ca\temp\proxies\m113\cargo02.002",
            "proxy:\ca\temp\proxies\m113\cargo02.004",
            "proxy:\ca\temp\proxies\m113\cargo02.005",
            "proxy:\ca\temp\proxies\m113\cargo03.007",
            "proxy:\ca\temp\proxies\m113\cargo03.008",
            "proxy:\ca\temp\proxies\m113\cargo03.009",
            "proxy:\ca\temp\proxies\m113\cargo02.010"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;


};
