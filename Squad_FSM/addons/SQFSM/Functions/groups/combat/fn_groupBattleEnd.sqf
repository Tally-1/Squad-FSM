private _action = "";

if(!([_x] call SQFM_fnc_validGroup))
then{_action = "eliminated"};

_self set ["battlefield", [-1,-1,-1]];
_self set ["state",               ""];
_self set ["action",          _action];
_self set ["available",         true];

(_self get "battleTimes")pushBackUnique round time;