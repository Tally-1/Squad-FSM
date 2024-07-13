params[ 
	["_pos", nil, [[]]],
	["_rad", nil,  [0]]
];
private _buildings = _pos nearObjects ["House", _rad] select {[_x] call SQFM_fnc_isHouse;};

_buildings;