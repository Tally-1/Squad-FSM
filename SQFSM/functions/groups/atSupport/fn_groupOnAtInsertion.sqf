private _taskData = _self call ["getTaskData"];
(_taskData get"params")params[
    ["_target",nil,    [objNull]],
    ["_caller",grpNull,[grpNull]]
];
private _valid = [_target] call SQFM_fnc_validAtTarget;
if!(_valid)exitWith{_taskData call["endTask"]};

private _targetPos = getPosATLVisual _target;
private _distance  = _targetPos distance2D (_self call ["getAvgPos"]);

private _infantryGrp = _self call ["isInfantryGroup"];
if(_infantryGrp)
exitWith{_self call ["infMoveOnAtTarget",[_target,true]]};

_self call ["deleteWaypoints"];

private _targetName  = getText (configfile >> "CfgVehicles" >> (typeOf _target) >> "displayName");
private _actionText  = ["Targeting ", _targetName]joinString"";
private _wpRad       = selectMin[_distance*0.9, 50];
private _waypoint    = _self call ["addWaypoint",[_targetPos, _wpRad, "DESTROY", "SQFM_fnc_atSupportDestroyWp"]];
private _revealNow   = _self call ["canAtReveal"];

_waypoint waypointAttachVehicle _target;

_self set  ["action", _actionText];
_self set  ["state", "engaging enemy vehicle"];

if(_revealNow)
then{_self call["revealAndTarget",[_target]]};

true;