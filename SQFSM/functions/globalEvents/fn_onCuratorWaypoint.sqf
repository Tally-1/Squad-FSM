params [
    ["_curator",    nil, [objNull]],
    ["_group",      nil, [grpNull]],
    ["_waypointID", nil,       [0]]
];

private _data = _group call getData;
private _idle = _data get "state" isEqualTo "idle";
_data call ["unStop"];
_data set  ["lastActionTime",time];

if(_idle)
then{_data set ["state", ""]};

true;