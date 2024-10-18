params[ 
    ["_center",    nil,    [[]]],
    ["_positions", nil,    [[]]]
];
private _scoredPositions = [];
private _sortAlgo = {
    private _score = [_center, _x, _scoredPositions]call SQFM_fnc_infantryIdlePosScore;
    _scoredPositions pushBackUnique _x;
    _score;
};
private _sorted   = [_positions, [], _sortAlgo, "ASCEND"] call BIS_fnc_sortBy;

_sorted;