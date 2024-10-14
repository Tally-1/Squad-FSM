params[ 
    ["_center",    nil,    [[]]],
    ["_positions", nil,    [[]]]
];

private _sortAlgo = { [_center, _x]call SQFM_fnc_infantryIdlePosScore};
private _sorted   = [_positions, [], _sortAlgo, "ASCEND"] call BIS_fnc_sortBy;

_sorted;