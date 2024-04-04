private ["_nearestSpawner"];
private _grpPos      = _self call ["getAvgPos"];
private _squadSize   = count (_self call ["getUnitsOnfoot"]);
private _allSpawners = [(entities "SQFSM_TransportSpawner"), [], {_grpPos distance _x}, "ASCEND"] call BIS_fnc_sortBy;

{
	if(!isNil "_nearestSpawner")exitWith{};
	private _data = _x call getData;
	private _canSpawn = (_data call ["transportAvailability", [_squadSize]])#0 &&{_data get "side" isEqualTo (_self get "side")};
	if(_canSpawn)exitWith{_nearestSpawner = _data;};
	
} forEach _allSpawners;

if(isNil "_nearestSpawner")exitWith{nil};

_nearestSpawner;