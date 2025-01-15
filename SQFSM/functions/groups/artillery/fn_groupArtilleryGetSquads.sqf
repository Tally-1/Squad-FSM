private _side   = _self get "side";
private _squads = [];
isNil
{{
    private _data = _x call getData;
    private _valid = false;
    if(!isNil "_data")then{
        private _thisSide  = _data get "side";
        private _wrongSide = _thisSide isNotEqualTo _side;
        if(_wrongSide)exitWith{};

        private _type    = _data get "groupType";
        private _notArty = !("artillery" in _type);
        if(_notArty)exitWith{};

        _valid = true;
    };

    if(_valid)then{_squads pushBack _x};
    
} forEach allGroups};

_squads;