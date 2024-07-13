params[
	["_vehicleData",nil,[createHashmap]]
];
if(_vehicleData call ["posClear"])exitWith{_vehicleData};
private ["_newSpawnData"];
private _shape = _vehicleData get "shape";

{
	if(_x get"shape" call ["canFit", [_shape]]
	&&{_x call ["posClear"]})
	exitWith{_newSpawnData = _x};
	
} forEach (_self get "vehicles");

if(isNil "_newSpawnData")exitWith{};

_newSpawnData;