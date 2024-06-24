params[
    ["_side",nil,[east]]
];
if!(_self call ["sideNeedReforce",[_side]])exitWith{};

private _battlePos = _self get "position";
private _groups    = (_self get "groups")select{side _x isEqualTo _side};

private _sortAlgo  = { 
    // This algorythm will prioritize groups closer to the center of battle, and groups with losses.
    private _data         = _x call getData;
    private _strengthCoef = _data call ["strengthCoef",[_side]];
    private _pos          = _data call ["getAvgPos"];
    
    private _distance     = _pos distance2D _battlePos;
    private _sortingValue = _distance*_strengthCoef;
    _sortingValue;
};
_groups = [_groups, [], _sortAlgo, "ASCEND"] call BIS_fnc_sortBy;

{
    private _data = _x call getData;
    if(_data call   ["canGetReinforcements"])
    then{_data call ["callReinforcements"]};
    
} forEach _groups;