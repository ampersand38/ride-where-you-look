#include "mods\a3.sqf"
#include "mods\rhsusaf.sqf"
#include "mods\rhsafrf.sqf"
#include "mods\cup.sqf"
#include "mods\3cb.sqf"
#include "mods\h60.sqf"

/*
// get seat proxies
_v = ([[curatorSelected # 0 # 0, [vehicle player, cursorObject] select (vehicle player == player)] select isNull curatorCamera, (get3DENSelected "" # 0 # 0)] select is3DEN);
private _sn = _v selectionNames "FireGeometry" select {
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
*/
