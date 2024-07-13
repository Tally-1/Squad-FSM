params [
	["_battlePos",nil,[[]]] // center of battle, used as key in the SQFM_battles hashmap.
];

_self set ["battlefield",  _battlePos];
_self set ["state",       "In battle"];
_self set ["action",      "In battle"];
_self set ["available",         false];

private _vehicle = _self getOrDefault ["transportVehicle",objNull];
if(!isNull _vehicle)then{_vehicle setUnloadInCombat [true, true]};

(_self get "battleTimes")pushBackUnique round time;