params[
	["_module",nil,[objNull]]
];
private _vehicles     = [];
private _capacities   = [];
private _parkingSpots = [];
private _side         = call compile (_module getVariable "sqfm_side");
private _globalizeFnc = {(_self get "module") setVariable ["SQFM_spawnerData", _self, true]};

{
	deleteVehicleCrew _x;
	private _data = [_x] call SQFM_fnc_transportVehicleData;
	if(!isNil "_data")then{
		_vehicles     pushBackUnique  _data;
		_capacities   pushBackUnique (_data get "capacity");
		_parkingSpots pushBackUnique [_data get "pos", _data get "dir", _data get "shape"];
	};
	deleteVehicle _x;	
} forEach (synchronizedObjects _module);

if(_vehicles isEqualTo [])exitWith{["Transport-spawner cannot init", "hint"]call dbgm;};

private _dataArr = [
	["vehicles",                               _vehicles],
	["module",                                   _module],
	["lastSpawnTime",                               time],
	["side",                                       _side],
	["assetCount", _module getVariable "sqfm_assetcount"],
	["maxCapacity",                                  nil],
	["waitingToSpawn",                             false],
/***********************************************************/
	["timeSinceSpawn",    {time-(_self get "lastSpawnTime")}],
	["spawnTransport",               SQFM_fnc_spawnTransport],
	["sendTransport",                 SQFM_fnc_sendTransport],
	["transportAvailability", SQFM_fnc_transportAvailability],
	["getVehicleType",        SQFM_fnc_spawnerGetVehicleType],
	["selectSpawnPos",            SQFM_fnc_transportSpawnPos],
	["globalize",                              _globalizeFnc]
];
private _maxCapacity = selectMax _capacities;
private _hashMap     = createHashmapObject [_dataArr];

_hashMap set         ["maxCapacity",  _maxCapacity];
_module  setVariable ["SQFM_spawnerData", _hashMap, true];

true;