params[
    ["_target",nil,     [objNull]]
];
if(_self call ["isInfantryGroup"])
exitWith{_self call ["infMoveOnAtTarget",[_target]]};

private _insertPos   = _self call ["atSupportInsertPos",[_target]];
private _validPos    = isNil "_insertPos";
private _squadPos    = _self call ["getAvgPos"];
private _targetPos   = if(_validPos)then{_insertPos}else{getPosATLVisual _target};
private _wpType      = if(_validPos)then{"MOVE"}else{"DESTROY"};
private _distance    = _targetPos distance2D _squadPos;
private _wpRad       = selectMin[_distance*0.9, 100];
private _wpFunction  = "SQFM_fnc_atSupportDestroyWp";
private _wpParams    = [_targetPos, _wpRad, _wpType, _wpFunction];
private _waypoint    = _self call ["addWaypoint",_wpParams];
private _revealNow   = _self call ["canAtReveal"];

_self set  ["state", "engaging enemy vehicle"];

if!(_validPos)
then{_waypoint waypointAttachVehicle _target};

if(_revealNow)
then{_self call["revealAndTarget",[_target]]};


true;