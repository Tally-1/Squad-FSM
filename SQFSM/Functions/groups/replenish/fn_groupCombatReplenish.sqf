params[
    ["_excluded",[],[[]]]
];

if!(_self call ["canCombatReplenish",[_excluded]])exitWith{[]};

private _groups    = (_self call ["getBattle"])get"groups";
private _validGrps = _groups select{_self call ["canReplenishGroup",[_x]]};
if(_validGrps isEqualTo [])exitWith{[]};

private _grpPos      = _self call ["getAvgPos"];
private _group       = _self get "grp";
private _targetGroup = ([_validGrps, [], SQFM_fnc_groupCombatReplenishAlgorythm, "ASCEND"] call BIS_fnc_sortBy)#0;
private _joined      = _self call ["replenishDirect",[_targetGroup, SQFM_travelWalkDist]];
if!(_joined)exitWith{[]};

[_group, _targetGroup];