params[
    ["_takenPositions",[],[[], createHashmap]]
];
private _groupPos       = _self call ["getAvgPos"];
private _urbanZones     = _self call ["getNearUrbanZones",[300]];
private _wpPositions    = call SQFM_fnc_allWaypointPositions;
private _urbanPositions = (_urbanZones apply {_x get "position"})select{!(_x in _takenPositions or{_x in _wpPositions})};
if(_urbanPositions isNotEqualTo [])exitWith{
    private _nearest = [_groupPos, _urbanPositions]call SQFM_fnc_getNearest;
    _nearest;
};

_groupPos;