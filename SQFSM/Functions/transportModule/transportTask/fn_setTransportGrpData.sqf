private _data  = _this;

_data set ["canDefend",             false];
_data set ["canAttack",             false];
_data set ["canHunt",               false];
_data set ["huntDistance",              0];
_data set ["canReinforce",          false];
_data set ["canCallReinforcements", false];
_data set ["canCallAir",            false];
_data set ["canCallArty",           false];
_data set ["groupType",       "transport"];
_data set ["squadClass",      "transport"];

_data call ["globalize"];

true;