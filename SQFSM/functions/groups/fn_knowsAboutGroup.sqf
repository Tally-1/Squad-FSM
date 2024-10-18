params[
    ["_observer", nil,[grpNull,west]],
    ["_target",   nil,     [grpNull]]
];
private _targetData = _target call getData;
private _units      = if(isNil "_targetData")then{units _target}else{_targetData call ["getGrpMembers"]};
private _knowsArr   = _units apply{_observer knowsAbout _x};
private _knowledge  = selectMax _knowsArr;

if(isNil "_knowledge")exitWith{0};

_knowledge;