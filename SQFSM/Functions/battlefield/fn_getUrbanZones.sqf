params[
	["_buildings", nil, [[]]],
	["_zoneRadius", 30,  [0]]
];
private _green      = [0,1,0,1];
private _zones      = [];
private _registered = [];
private _drawLines  = {{drawLine3D _x}forEach(_self get "lines")};
private _sortAlgo   = {(count (_x buildingPos -1)) + ((boundingBox _x)#2)};
private _filter     = {
	private _excluded = _x in _registered;
	private _away     = _x distance2D _pos > _zoneRadius;
	private _include  = (_excluded isEqualTo false && {_away isEqualTo false});
	_include;
};

_buildings = [_buildings, [], _sortAlgo, "DESCEND"] call BIS_fnc_sortBy;

{
	private _building   = _x;
	private _pos        = getPosATL _building;
	private _nearHouses = ([_pos, _zoneRadius] call SQFM_fnc_nearBuildings)select{!(_x in _registered)};
	private _count      = count _nearHouses;
	if(_count > 2)then{ 
		private _newPos = [_nearHouses] call SQFM_fnc_avgPos2D;
		private _newRad = _zoneRadius + (_newPos distance2D _pos);

		_nearHouses           = ([_newPos, _newRad] call SQFM_fnc_nearBuildings)select{!(_x in _registered)};
		private _sizes        = _nearHouses apply {(boundingBox _x)#2};
		private _buildingSize = selectMax _sizes;
		private _radius       = ([_newPos, _nearHouses] call SQFM_fnc_clusterRadius);//+_buildingSize;
		private _lines = [_newPos, _radius, 16, _green] call SQFM_fnc_getCircleLines;
		private _dataArr = [
			["position",      _newPos],
			["radius",        _radius],
			["buildings", _nearHouses],
			["lines",          _lines],
			["drawLines",  _drawLines]
		];
		private _hashMap = createHashmapObject [_dataArr];

		_zones pushBackUnique _hashMap;
		_registered append _nearHouses;
		(_self get "buildings") insert [0, _nearHouses, true];
	};
	
} forEach _buildings;

_zones;