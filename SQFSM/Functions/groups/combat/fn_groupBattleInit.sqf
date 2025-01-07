params [
	["_battlePos",nil,[[]]] // center of battle, used as key in the SQFM_battles hashmap.
];
_self set ["battlefield",  _battlePos];
_self set ["state",       "In battle"];
_self set ["action",      "In battle"];
_self set ["available",         false];

private _class = _self get "squadClass";
if(_class isEqualTo "transport")exitWith{};

(_self get "battleTimes")pushBackUnique round time;



private _aborted = _self call ["abortTransport"];
if(!_aborted)then{_self call ["leaveUnarmedVehicles"]};

private _vehicle = _self getOrDefault ["transportVehicle",objNull];
if(!isNull _vehicle)then{_vehicle setUnloadInCombat [true, true]};


true;