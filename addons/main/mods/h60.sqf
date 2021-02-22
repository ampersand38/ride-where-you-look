if (isClass (configFile >> "CfgPatches" >> "vtx_uh60")) then {

    ["vtx_H60_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\uh60m\gunner.003",
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
            "proxy:\ca\temp\proxies\m113\cargo03.013",
            "proxy:\ca\temp\proxies\m113\cargo03.014",
            "proxy:\ca\temp\proxies\m113\cargo03.015",
            "proxy:\ca\temp\proxies\m113\cargo03.016",
            "proxy:\ca\temp\proxies\m113\cargo03.017",
            "proxy:\ca\temp\proxies\m113\cargo03.018",
            "proxy:\ca\temp\proxies\m113\cargo03.019",
            "proxy:\ca\temp\proxies\m113\cargo03.020",
            "proxy:\ca\temp\proxies\m113\cargo03.021",
            "proxy:\ca\temp\proxies\m113\cargo03.022",
            "proxy:\ca\temp\proxies\m113\cargo03.023"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["vtx_UH60M", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:\ca\temp\proxies\m113\cargo03.012",
            "proxy:\ca\temp\proxies\m113\cargo03.013",
            "proxy:\ca\temp\proxies\m113\cargo03.014",
            "proxy:\ca\temp\proxies\m113\cargo03.015",
            "proxy:\ca\temp\proxies\m113\cargo03.016",
            "proxy:\ca\temp\proxies\m113\cargo03.017",
            "proxy:\ca\temp\proxies\m113\cargo03.018",
            "proxy:\ca\temp\proxies\m113\cargo03.019",
            "proxy:\ca\temp\proxies\m113\cargo03.020",
            "proxy:\ca\temp\proxies\m113\cargo03.021",
            "proxy:\ca\temp\proxies\m113\cargo03.022",
            "proxy:\ca\temp\proxies\m113\cargo03.023",
            "proxy:\ca\temp\proxies\uh60m\gunner.004",
            "proxy:\ca\temp\proxies\uh60m\gunner.005"
        ]];
    }, true, ["vtx_HH60"], true] call CBA_fnc_addClassEventHandler;

    ["vtx_UH60M_SLICK", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
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
            "proxy:\ca\temp\proxies\m113\cargo03.016",
            "proxy:\ca\temp\proxies\m113\cargo03.017",
            "proxy:\ca\temp\proxies\m113\cargo03.018",
            "proxy:\ca\temp\proxies\m113\cargo03.019",
            "proxy:\ca\temp\proxies\m113\cargo03.020",
            "proxy:\ca\temp\proxies\m113\cargo03.021",
            "proxy:\ca\temp\proxies\m113\cargo03.022",
            "proxy:\ca\temp\proxies\m113\cargo03.023",
            "proxy:\ca\temp\proxies\uh60m\gunner.001",
            "proxy:\ca\temp\proxies\uh60m\gunner.002",
            "proxy:\ca\temp\proxies\uh60m\gunner.004",
            "proxy:\ca\temp\proxies\uh60m\gunner.005"
        ]];
    }, true, ["vtx_HH60"], true] call CBA_fnc_addClassEventHandler;

    ["vtx_MH60S", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
            "proxy:\ca\temp\proxies\m113\cargo03.012",
            "proxy:\ca\temp\proxies\m113\cargo03.013",
            "proxy:\ca\temp\proxies\m113\cargo03.014",
            "proxy:\ca\temp\proxies\m113\cargo03.015",
            "proxy:\ca\temp\proxies\m113\cargo03.016",
            "proxy:\ca\temp\proxies\m113\cargo03.017",
            "proxy:\ca\temp\proxies\m113\cargo03.018",
            "proxy:\ca\temp\proxies\m113\cargo03.019",
            "proxy:\ca\temp\proxies\m113\cargo03.020",
            "proxy:\ca\temp\proxies\m113\cargo03.021",
            "proxy:\ca\temp\proxies\m113\cargo03.022",
            "proxy:\ca\temp\proxies\m113\cargo03.023",
            "proxy:\ca\temp\proxies\uh60m\gunner.004",
            "proxy:\ca\temp\proxies\uh60m\gunner.005"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["vtx_HH60", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
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
            "proxy:\ca\temp\proxies\m113\cargo03.018",
            "proxy:\ca\temp\proxies\m113\cargo03.019",
            "proxy:\ca\temp\proxies\uh60m\gunner.004",
            "proxy:\ca\temp\proxies\uh60m\gunner.005"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["vtx_MH60M", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
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
            "proxy:\ca\temp\proxies\m113\cargo03.018",
            "proxy:\ca\temp\proxies\m113\cargo03.019",
            "proxy:\ca\temp\proxies\m113\cargo03.020",
            "proxy:\ca\temp\proxies\uh60m\gunner.004",
            "proxy:\ca\temp\proxies\uh60m\gunner.005"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["vtx_MH60S_Pylons", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
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
            "proxy:\ca\temp\proxies\m113\cargo03.018",
            "proxy:\ca\temp\proxies\m113\cargo03.019",
            "proxy:\ca\temp\proxies\uh60m\gunner.004",
            "proxy:\ca\temp\proxies\uh60m\gunner.005"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["vtx_MH60S_GAU21L", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
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
            "proxy:\ca\temp\proxies\m113\cargo03.014",
            "proxy:\ca\temp\proxies\m113\cargo03.015",
            "proxy:\ca\temp\proxies\m113\cargo03.016",
            "proxy:\ca\temp\proxies\m113\cargo03.017",
            "proxy:\ca\temp\proxies\m113\cargo03.019",
            "proxy:\ca\temp\proxies\m113\cargo03.020",
            "proxy:\ca\temp\proxies\m113\cargo03.021",
            "proxy:\ca\temp\proxies\uh60m\gunner.005"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    ["vtx_MH60M_DAP", "init", {
        (_this select 0) setVariable ["RWYL_proxyBlacklist", [
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
            "proxy:\ca\temp\proxies\m113\cargo03.018",
            "proxy:\ca\temp\proxies\m113\cargo03.019",
            "proxy:\ca\temp\proxies\uh60m\gunner.001",
            "proxy:\ca\temp\proxies\uh60m\gunner.002",
            "proxy:\ca\temp\proxies\uh60m\gunner.004",
            "proxy:\ca\temp\proxies\uh60m\gunner.005"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;

};
