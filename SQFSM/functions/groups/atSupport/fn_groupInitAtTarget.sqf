params[
    ["_target",nil,[objNull]]
];
private _hunterGrps = _target getVariable ["SQFM_hunterGrps", []];
private _group      = _self get "grp";
[_target] call SQFM_fnc_atSupportTargetEh;

_hunterGrps pushBackUnique _group;
_target setVariable ["SQFM_hunterGrps", _hunterGrps];

true;