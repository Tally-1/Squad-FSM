params[ 
    ["_center", nil,    [[]]],
    ["_rad",    nil,     [0]],
    ["_sort",   true, [true]]
];
private _positions = [];

_positions insert [0,([_center, _rad] call SQFM_fnc_getNearCoverPositions),   true];
_positions insert [0,([_center, _rad] call SQFM_fnc_getNearBuildingPositions),true];
_positions insert [0,([_center, _rad] call SQFM_fnc_getNearFipoPositions),    true];

if!(_sort)exitWith{_positions};

private _sorted = [_center, _positions] call SQFM_fnc_sortInfantryIdlePositions;

_sorted;