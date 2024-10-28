params[
    ["_target",nil,[objNull]]
];
private _group      = _self get "grp";
private _hunterGrps = _target getVariable "SQFM_hunterGrps";
private _index      = _hunterGrps find _group;
private _valid      = [_target] call SQFM_fnc_validAtTarget;

_hunterGrps deleteAt _index;

if(_valid)exitWith{};

private _eh = _target getVariable "SQFM_atSupportTargetEh";
if(isNil "_eh")exitWith{};

_target removeEventHandler ["Hit", _eh];
_target setVariable ["SQFM_atSupportTargetEh",nil];

true;