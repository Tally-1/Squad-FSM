params[
	["_men",      nil, [[]]],
	["_vehicles", nil, [[]]]
];
if(_men      isEqualTo [])exitWith{_vehicles};
if(_vehicles isEqualTo [])exitWith{[]};

private _pos            = [_men] call SQFM_fnc_avgPos2D;
private _capacities     = _vehicles apply {_x emptyPositions "";};
private _capacityNeeded = count _men;
private _algorythm      = {
		private _distance    = _pos distance2D _x;
		private _capacity    = _x emptyPositions "";//
		private _capDiff     = [_capacityNeeded, _capacity] call SQFM_fnc_numDiff;
		private _hasCapacity = _capacity >= _capacityNeeded;
		private _perfect     = _capacity isEqualTo _capacityNeeded;

		if(_hasCapacity) then{_distance = _distance*0.5};
		if(_perfect)     then{_distance = _distance*0.5};
		_distance;
};

_vehicles = [_vehicles, [], _algorythm, "ASCEND"] call BIS_fnc_sortBy;

_vehicles;