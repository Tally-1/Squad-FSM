params [
	["_battlePos",nil,[[]]] // center of battle, used as key in the SQFM_battles hashmap.
];

_self set ["battlefield",  _battlePos];
_self set ["state",       "In battle"];
_self set ["action",      "In battle"];
_self set ["available",         false];

(_self get "battleTimes")pushBackUnique round time;