// testing, update fncs on the fly
//#define PREP(var1) TRIPLES(ADDON,fnc,var1) = { call compile preProcessFileLineNumbers '\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT_F\functions\DOUBLES(fnc,var1).sqf' }

PREP(findSeat);
PREP(fullCrew);
PREP(getProxyPosition);
PREP(getSeats);
PREP(getVehicleCurator);
PREP(getVehicleUnit);
PREP(getUnit);
PREP(moveSeatLocal);
PREP(nearestOnScreen);
PREP(selectSeat);
PREP(showSeats);
PREP(showSeatsPFH);

