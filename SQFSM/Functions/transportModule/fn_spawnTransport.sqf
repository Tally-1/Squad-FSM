params[
	["_capacity",nil,[]]
];
private _vehicleData = _self call ["getVehicleType", [_capacity]];
if(isNil "_vehicleData")exitWith{};

private _spawnPosData = _self call ["selectSpawnPos", [_vehicleData]];
if(isNil "_spawnPosData")exitWith{};

private _count = _self get "assetCount";
if(_count < 1)exitWith{};

private _vehicleType = _vehicleData  get "type";
private _spawnPos    = _spawnPosData get "pos";
private _spawnDir    = _spawnPosData get "dir";

private _vehicle = createVehicle [
	_vehicleType, 
	_spawnPos, 
	[], 
	0, 
	"CAN_COLLIDE"
];

_self set ["assetCount",_count-1];
_self set ["lastSpawnTime", time];

_vehicle allowDamage false;
_vehicle setDir      _spawnDir;
_vehicle setPosATL   _spawnPos;
_vehicle setVariable ["SQFM_transport",             true, true];
_vehicle setVariable ["SQFM_Module",(_self get "module"), true];
_vehicle setUnloadInCombat [false, false];

(_self get "side") createVehicleCrew _vehicle;

{[_x] spawn SQFM_fnc_transportCrewGetOutEh} forEach (crew _vehicle);

{_x addCuratorEditableObjects [[_vehicle],true]} forEach allCurators;

_vehicle spawn{
	sleep 5; 
	_this allowDamage true;
};

_vehicle;