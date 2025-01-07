private _inValidGroups = [];
private _groups        = _self get "groups" select {!isNull _x};
{
    private _data = _x call getData;
    if(!isNil "_data"
    &&{_data call ["isValid"]})
    then{_data call ["handleBattleTask",[_self]]}
    else{_inValidGroups pushBack _x};    
    
} forEach _groups;

{
    private _data = _x call getData;
    if(!isNil "_data")
    then{_data call ["endBattleTask",[_self]]};
    
} forEach _invalidGroups;


true;