params[
    ["_pos",   nil, [[]]],
    ["_rad",   nil,  [0]],
    ["_roads", nil, [[]]]  // array of hashmaps extracted by using SQFM_fnc_hashifyRoads on an array of roadsegments.
];
private _exits = [];


{
    if([_pos,_rad,_x] call SQFM_fnc_roadIsZoneExit)
    then{_exits pushBack _x};
    
} forEach _roads;


_exits;