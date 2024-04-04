private _idleGroups = [];

{
    private _data = _x call getData;

    if((!isNil "_data")
    && {side _x in SQFM_validSides
    && {_data call ["isValid"]
    && {_data call ["isIdle"]
    && {_data call ["isPlayerGroup"] isEqualTo false
    }}}})
    then{_idleGroups pushBack _x};
    
} forEach allGroups;

_idleGroups;