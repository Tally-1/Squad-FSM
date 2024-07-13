params[
	["_capacityNeeded",nil,[]]
];
private _perfectTypes = [];
private _validTypes   = [];
{
	private _perfect = _x get "capacity" isEqualTo _capacityNeeded;
	private _valid   = _x get "capacity" >= _capacityNeeded;
	if(_perfect)
	then{_perfectTypes pushBack _x}else{if(_valid)
	then{_validTypes   pushBack _x}};

} forEach (_self get "vehicles");

if(_perfectTypes isNotEqualTo [])exitWith{
	private _vehicleData = selectRandom _perfectTypes;
	_vehicleData;
};

if(_validTypes isEqualTo [])exitWith{};

private _vehicleData = ([_validTypes, [], {[_capacityNeeded, _x get "capacity"]}, "ASCEND"] call BIS_fnc_sortBy)#0;

_vehicleData;