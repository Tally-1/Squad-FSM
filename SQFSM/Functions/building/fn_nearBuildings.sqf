params[ 
	["_pos", nil,    [[]]],
	["_rad", nil,     [0]],
    ["_sort",false,[true]],
    ["_ownMen",[],   [[]]]
];
private _buildings = _pos nearObjects ["House", _rad] select {[_x] call SQFM_fnc_isHouse};

if(_sort)
then{_buildings=[_buildings,_pos,_ownMen] call SQFM_fnc_sortBuildings};

_buildings;