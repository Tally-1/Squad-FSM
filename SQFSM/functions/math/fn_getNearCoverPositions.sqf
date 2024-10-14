params[ 
    ["_pos",  nil,     [[]]],
    ["_rad",  nil,      [0]],
    ["_sort", false, [true]]
];
private _coverObjects = nearestTerrainObjects [
    _pos, 
    [
        "TREE", 
        "SMALL TREE", 
        "BUSH", 
        "HOUSE", 
        "ROCK", 
        "ROCKS", 
        "WALL",
        "STACK"
    ], 
        _rad, 
        false
]select{!isHidden _x};

private _positions = _coverObjects apply {getPosATLVisual _x};

if(_sort)then{
    _positions = [_positions, [], {_pos distance2D _x}, "ASCEND"] call BIS_fnc_sortBy;
};

_positions;