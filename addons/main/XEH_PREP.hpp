// testing, update fncs on the fly
//#define PREP(var1) TRIPLES(ADDON,fnc,var1) = { call compile preProcessFileLineNumbers '\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT_F\functions\DOUBLES(fnc,var1).sqf' }
//amp_slingload_fnc_adjustRigging = {call compile preProcessFileLineNumbers '\z\amp\addons\slingload\functions\fnc_adjustRigging.sqf'}

PREP(findSeat);
PREP(moveSeat);
