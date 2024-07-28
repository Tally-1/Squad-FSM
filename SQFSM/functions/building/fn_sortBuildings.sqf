params[
    ["_buildings", nil,[[]]],
    ["_pos",       nil,[[]]],
    ["_ownMen",    nil,[[]]]
];
([_buildings, _pos] call SQFM_fnc_buildingArrData)
params[
    ["_maxDistance", nil, [0]],
    ["_maxPosCount", nil, [0]],
    ["_maxSize",     nil, [0]] 
];


_buildings = [_buildings, [],{[_x, _pos, _maxDistance, _maxPosCount, _maxSize,_ownMen]call SQFM_fnc_getBuildingScore}, "DESCEND"] call BIS_fnc_sortBy;

_buildings;