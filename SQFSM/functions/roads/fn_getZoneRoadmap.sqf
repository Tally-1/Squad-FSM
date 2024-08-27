params[
    ["_pos", nil, [[]]],
    ["_rad", nil,  [0]]
];
private _roads         = [_pos nearRoads _rad] call SQFM_fnc_hashifyRoads;
private _positions     = _roads apply {_x get "position"};
private _exits         = [_pos, _rad, _roads] call SQFM_fnc_getZoneExitRoads;
private _exitPositions = _exits apply {_x get "position"};

private _dataArr = [
    ["roads",                 _roads],
    ["positions",         _positions],
    ["exits",                 _exits],
    ["exitPositions", _exitPositions]
];

private _roadMap = createHashmapObject[_dataArr];

_roadMap;