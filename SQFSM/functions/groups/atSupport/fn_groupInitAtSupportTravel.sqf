params[
    ["_target",nil,     [objNull]]
];
private _grpPos      = _self call ["getAvgPos"];
private _infantryGrp = _self call ["isInfantryGroup"];
private _distance    = _grpPos distance2D _target;
private _maxDist     = 1000; // if(_infantryGrp)then{600}else{1000};

if(_distance<_maxDist)exitWith{_self call ["atSupportDirectMove",[_target]]};

private _insertPos = _self call ["atSupportInsertPos",[_target]];
if(isNil "_insertPos")exitWith{false};

private _canTravel = _self call ["initTravel", [_insertPos]];
if!(_canTravel)exitWith{false};

true;