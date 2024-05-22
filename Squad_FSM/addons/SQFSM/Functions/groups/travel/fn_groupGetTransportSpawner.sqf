private ["_nearestSpawner"];
private _grpPos      = _self call ["getAvgPos"];
private _squadSize   = count (_self call ["getUnitsOnfoot"]);
private _spawnModuls = entities "SQFSM_TransportSpawner";
// Devalue spawners that just spawned a vehicle to spread the load.
private _sortingAlgo = {
	private _distance = _grpPos distance _x;
	private _data     = _x call getData;
	
	if(_data get "waitingToSpawn")
	then{_distance = _distance+1000};

	_distance;
};

private _allSpawners = [_spawnModuls, [], _sortingAlgo, "ASCEND"] call BIS_fnc_sortBy;

{
	if(!isNil "_nearestSpawner")exitWith{};

	private _data        = _x call getData;
	private _sidesMatch  = _data get "side" isEqualTo (_self get "side");
	private _hasCapacity = (_data call ["transportAvailability", [_squadSize]])#0;
	private _canSpawn    = _hasCapacity && {_sidesMatch};

	if(_canSpawn)exitWith{_nearestSpawner = _data;};
	
} forEach _allSpawners;

if(isNil "_nearestSpawner")exitWith{};

_nearestSpawner;