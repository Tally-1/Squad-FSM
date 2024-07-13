private _assigned = [];
private _joined   = [];
private _groups   = _self get "groups";

if(isNil "_groups")
exitWith{"nil battle groups" call dbgm;};

{
    private _data    = _x call getData;
    private _aGrps = [];

    if(_data call ["isValid"])
    then{_aGrps = _data call ["combatReplenish", [_assigned]]};
    
    if(_aGrps isNotEqualTo [])then{
        _assigned insert [0, _aGrps, true];
        _joined pushBackUnique (_aGrps#0);
    };

    
} forEach _groups;

private _count = count _joined;
if(_count > 0)then{
    [[_count, " group(s) joined other squads due to losses"]] call dbgm;
};

_assigned = [];