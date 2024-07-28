params [
    ["_curator",    nil, [objNull]],
    ["_group",      nil, [grpNull]],
    ["_waypointID", nil,       [0]]
];

private _data = _group call getData;
_data call ["unStop"];

true;