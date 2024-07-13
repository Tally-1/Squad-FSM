params[
	["_transportGroup", nil, [grpNull]]
];
private _grpData       = _transportGroup getVariable "SQFM_grpData";
private _spawnerModule = _transportGroup getVariable "SQFM_transportModule";
private _vehicle       = _transportGroup getVariable "SQFM_transportVehcicle";
private _spawnData     = _spawnerModule getVariable "SQFM_spawnerData";
private _restoreCount  = alive _vehicle && {_vehicle distance _spawnerModule < 300};

if(_restoreCount)then{
	private _count = _spawnData get"assetCount";
	_spawnData set ["assetCount", _count+1];
	"Transport vehicle returned to base" call dbgm;
}
else{"Transport vehicle lost" call dbgm};

_spawnData call ["globalize"];
_taskData  call ["endTask"];

{
    _x removeAllEventHandlers "GetOutMan";
    deleteVehicle _x;
} forEach units _transportGroup;

deleteVehicle _vehicle;

true;