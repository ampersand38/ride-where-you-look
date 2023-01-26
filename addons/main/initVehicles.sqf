// Proxy tweaks: blacklist, whitelist, index
#include "mods\a3.sqf"
#include "mods\rhsusaf.sqf"
#include "mods\rhsafrf.sqf"
#include "mods\cup.sqf"
#include "mods\3cb.sqf"
#include "mods\h60.sqf"
#include "mods\vme_pla.sqf"

/*
// get seat proxies
_v = ([[curatorSelected # 0 # 0, [vehicle player, cursorObject] select (vehicle player == player)] select isNull curatorCamera, (get3DENSelected "" # 0 # 0)] select is3DEN);
private _sn = _v selectionNames "FireGeometry" select {
    private _proxy = toLower _x;
    private _proxyIndex = _proxy select [(_proxy find ".") + 1];
    // has non-zero selection position
    !((_v selectionPosition [_proxy, "FireGeometry", "AveragePoint"]) isEqualTo [0,0,0]) && {
    // ends with a number after a period
    ((parseNumber _proxyIndex > 0) || {_proxyIndex isEqualTo "0"}) && {
    // contains seat role
    (("cargo" in toLower _proxy) || {("gunner" in toLower _proxy) || {("driver" in toLower _proxy) ||
    {("commander" in toLower _proxy) || {("pilot" in toLower _proxy)}}}})}}
};
_proxies = _sn joinString (toString [13,10]);
copyToClipboard _proxies;
_proxies

// get order of seat proxies
amp_cargoIndex = 0;
player addAction ["Next Cargo Seat", {
    systemChat str amp_cargoIndex;
    [vehicle player] spawn {
        moveOut player;
        waitUntil {vehicle player == player };
        player moveInCargo [_this # 0,amp_cargoIndex];
        amp_cargoIndex = amp_cargoIndex + 1;
    };
}, nil, 10, true, false]

// get order of seat proxies
amp_turretIndex = 0;
player addAction ["Next Turret Seat", {
    systemChat str amp_turretIndex;
    [vehicle player] spawn {
        moveOut player;
        waitUntil {vehicle player == player };
        player moveInTurret [_this # 0,[amp_turretIndex]];
        amp_turretIndex = amp_turretIndex + 1;
    };
}, nil, 10, true, false];

// draw seat proxies
if !(isNil "amp_id") then { removeMissionEventHandler ["Draw3D", amp_id]; };
amp_id = addMissionEventHandler ["Draw3D",{
    private _v = ([[curatorSelected # 0 # 0, [vehicle player, cursorObject] select (vehicle player == player)] select isNull curatorCamera, (get3DENSelected "" # 0 # 0)] select is3DEN);
    private _sn = _v selectionNames "FireGeometry" select {
        private _proxy = toLower _x;
        private _proxyIndex = _proxy select [(_proxy find ".") + 1];
        // has non-zero selection position
        !((_v selectionPosition [_proxy, "FireGeometry", "AveragePoint"]) isEqualTo [0,0,0]) && {
        // ends with a number after a period
        ((parseNumber _proxyIndex > 0) || {_proxyIndex isEqualTo "0"}) && {
        // contains seat role
        (("cargo" in toLower _proxy) || {("gunner" in toLower _proxy) || {("driver" in toLower _proxy) ||
        {("commander" in toLower _proxy) || {("pilot" in toLower _proxy)}}}})}}
    };
    {
        if true then {
            drawIcon3D [
                "a3\ui_f\data\Map\MarkerBrushes\cross_ca.paa",
                [1,1,1,1],
                _v modelToWorldVisual (_v selectionPosition [_x, "FireGeometry", "AveragePoint"]),
                1,1,0,
                _x
            ];
        };
    } forEach _sn;
}];

*/
