params[
	["_transportGroup", nil, [grpNull]]
];
private _grpData           = _transportGroup getVariable "SQFM_grpData";
private _taskData          = _grpData get "taskData";
(_taskData get "params")params[
	["_passengerGrp",   nil,      [grpNull]],
	["_vehicle",        nil,      [objNull]],
	["_callerData",     nil,[createHashmap]],
	["_spawnerModule",  nil,      [objNull]]
];
private _spawnData         = _spawnerModule getVariable "SQFM_spawnerData";
private _restoreAssetCount = alive _vehicle && {_vehicle distance _spawnerModule < 300};

if(_restoreAssetCount)then{
	private _count = _spawnData get"assetCount";
	_spawnData set ["assetCount", _count+1];
	"Transport vehicle returned to base" call dbgm;
}
else{"Transport vehicle lost" call dbgm};

_taskData call ["endTask"];
deleteVehicle _vehicle;
{deleteVehicle _x} forEach units _transportGroup;;

true;