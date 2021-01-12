if (isClass (configFile >> "CfgPatches" >> "CUP_Vehicles_Core")) then {
    ["CUP_BMP1_base", "init", {
        (_this select 0) setVariable ["RWYL_proxyOffsets", [
            "proxy:\ca\temp\proxies\bmp2\driver.001",
            "proxy:\ca\temp\proxies\bmp2\gunner.001"
        ]];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
};
