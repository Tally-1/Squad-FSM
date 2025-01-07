params [
    ["_center",   nil,[[],objNull]],
    ["_positions",nil,        [[]]]
    
];
_positions = [_positions, [], {_center distance2D _x}, "ASCEND"] call BIS_fnc_sortBy;

_positions;