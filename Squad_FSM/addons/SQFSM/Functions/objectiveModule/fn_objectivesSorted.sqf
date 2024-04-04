params[
    ["_objectives",  nil,     [[]]],
    ["_group",       nil,[grpNull]]
];
private _side      = (_group call getData) call ["getStrSide"];
private _pos       = (_group call getData) call ["getAvgPos"];
private _allcounts = _objectives apply {(_x call getData) call ["countAssignedAssets",[_side]]};
private _max       = selectMax _allcounts;

if(_max isEqualTo 0)then{_max = 0.0001;};

private _algorythm = {
    private _distance   = _pos distance2D _x;
    private _assetCount = (_x call getData) call ["countAssignedAssets",[_side]];
    
    if  (_assetCount ==   0)
    then{_assetCount =  0.1};
    
    private _coef       = _assetCount / _max;
    private _sortingVal = _distance*_coef;
    _sortingVal;
};

_objectives = [_objectives, [], _algorythm, "ASCEND"] call BIS_fnc_sortBy;

_objectives;