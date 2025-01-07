params[
    ["_rad",nil,[0]]
];
private _group   = _self get "grp";
private _man     = [_group] call SQFM_fnc_firstValidGroupMember;
if(isNil "_man") exitWith{[]};
if(isNull _man)  exitWith{[]};

private _pos     = _self call ["getAvgPos"];
private _enemies = _group targets [true, _rad, [], 5, _pos];

_enemies = _enemies select{
    private _valid   = [_man, _x] call SQFM_fnc_validEnemy;
    private _known   = _group knowsAbout _x > 3.5;
    private _include = _valid && _known;

    _include;
};

_enemies;