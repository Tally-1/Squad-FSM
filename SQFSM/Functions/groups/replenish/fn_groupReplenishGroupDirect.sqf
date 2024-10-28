params[
    ["_targetGroup",nil,[grpNull]],
    ["_maxDistance",nil,      [0]]
];
private _targetData = _targetGroup call getData;
if(isNil "_targetData")exitWith{false};

private _targetPos  = _targetData call ["getAvgPos"];
if(isNil "_targetPos")exitWith{false};

private _grpPos     = _self call ["getAvgPos"];
if(isNil "_grpPos")exitWith{false};

private _distance   =  _grpPos distance2D _targetPos;
if(_distance > _maxDistance)exitWith{false};

private _joined = _self call ["mergeWithGroup",[_targetGroup]];
_targetData set ["awaitingReplenish", false];

_joined;