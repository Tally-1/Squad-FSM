private _group        = _self get "group";
private _grpData      = _group call getData;
private _target       = _self get "target";
private _targetData   = _target call getData;
private _targetPos    = _targetData call ["getAvgPos"];
private _destination  = _self get "destination";
private _distance     = _destination distance2D _targetPos;
if(_distance < 50)exitWith{};

_grpData call ["deleteWaypoints"];
_self    set  ["destination", _targetPos];

private _wpParams = [_targetPos, 50, "SAD", "SQFM_fnc_groupEndBattleTask"];
private _waypoint = _grpData call ["addWaypoint",_wpParams];

_grpData call ["update"];
_self call ["flashAction", ["Updated destination"]];
_self set  ["waypoints", [_waypoint]];

true;