params[
    ["_objectives",  nil,     [[]]],
    ["_group",       nil,[grpNull]]
];
private _side = (_group call getData) call ["getStrSide"];
private _pos  = (_group call getData) call ["getAvgPos"];


private _algorythm = {
    private _objData    = _x call getData;
    private _distance   = _pos distance2D _x;
    private _coef       = 1;
    private _assetCount = _objData call ["countAssignedAssets",[_side]];
    private _hostile    = count ((_objData call ["getSidesInZone"])select{[_x,(side _group)]call SQFM_fnc_hostile})>0;
    private _noAssets   = _assetCount isEqualTo 0;

    if(_noAssets) then{_coef = _coef-0.3};
    if(_hostile)  then{_coef  = _coef-0.4};

    private _sortingVal = _distance*_coef;

    
    _sortingVal;
};

_objectives = [_objectives, [], _algorythm, "ASCEND"] call BIS_fnc_sortBy;

_objectives;