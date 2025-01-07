private _target = _self call ["newTarget"];
if(isNil "_target") exitWith{_self call ["end",[false]]};
if(isNull _target)  exitWith{_self call ["end",[false]]};

private _grpData     = _self get "group" call getData;
private _targetData  = _target call getData;
private _targetPos   = _targetData call ["getAvgPos"];

_grpData call ["deleteWaypoints"];

_self set ["type",            "push"];
_self set ["target",         _target];
_self set ["destination", _targetPos];


private _wpParams = [_targetPos, 50, "SAD", "SQFM_fnc_groupEndBattleTask"];
private _waypoint = _grpData call ["addWaypoint",_wpParams];

_grpData call ["update"];
_self call ["flashAction", ["Pushing enemy"]];
_self set  ["waypoints", [_waypoint]];

true;