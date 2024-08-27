params[
	["_clusterData", nil,      [[]]],
	["_includeGrid", false, [false]]
];

private _getVeh = {_self get "objects" select {[_x] call SQFM_fnc_validVehicle}};
private _getMen = {_self get "objects" select {[_x] call SQFM_fnc_validMan}};

private _dataArr = [
	["position",   _clusterData#0],
	["radius",     _clusterData#1],
	["objects",    _clusterData#2],
	["sides",      _clusterData#3],
	["groups",     _clusterData#4],
	["grid",                  nil],
	["timeRegistered", round time],

/******************************************/

	["setGrid",     SQFM_fnc_setClusterGrid],
	["getVehicles", _getVeh],
	["getMen",      _getMen]
];

private _hashmap = createHashmapObject [_dataArr];


if(_includeGrid)then{_hashmap call ["setGrid"]};

_hashmap;