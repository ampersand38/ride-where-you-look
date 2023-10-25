#define DEBUG_SYNCHRONOUS
#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) FUNC(fncName) = { call compile preProcessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf) }
    #define LINKFUNC(x) {_this call FUNC(x)}
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
    #define LINKFUNC(x) FUNC(x)
#endif
