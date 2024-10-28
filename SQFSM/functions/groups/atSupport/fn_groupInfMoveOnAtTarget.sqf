params[
    ["_target",nil,[objNull]],
    ["_engage",false,[false]]
];
private _grpPos     = _self call ["getAvgPos"];
private _targetPos  = getPosATLVisual _target;
private _distance   = _targetPos distance2D getPosATLVisual leader (_self get "grp"); // _grpPos;
private _wpFunction = "SQFM_fnc_atSupportDestroyWp";
private _radCoef    = 0.9;

_self call ["deleteWaypoints"];
if(_distance < 400
||{_engage})exitWith{
    private _wpRad     = selectMin[_distance*_radCoef, 100];
    private _wpParams  = [_targetPos, _wpRad, "MOVE", _wpFunction,nil,nil,20];
    _self call ["addWaypoint",_wpParams];
    _self call["infEngageAtTarget",[_target]];
    
    true;
};

private _insertPos  = _self call ["atSupportInsertPos",[_target]];
private _validPos   = !isNil "_insertPos";
private _targetPos  = if(_validPos)then{_insertPos}else{getPosATLVisual _target};
private _distance   = _targetPos distance2D getPosATLVisual leader (_self get "grp");
private _minRad     = if(_validPos)then{100}else{400};
private _wpRad      = selectMin[_distance*_radCoef, _minRad];
private _wpParams   = [_targetPos, _wpRad, "MOVE", _wpFunction];
private _waypoint   = _self call ["addWaypoint",_wpParams];

true;