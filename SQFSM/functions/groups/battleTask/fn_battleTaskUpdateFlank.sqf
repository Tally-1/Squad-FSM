private _group        = _self get "group";
private _grpData      = _group call getData;
private _grpPos       = _grpData call ["getAvgPos"];
private _target       = _self get "target";
private _targetData   = _target call getData;
private _targetPos    = _targetData call ["getAvgPos"];
private _targetNear   = _targetPos distance2D _grpPos < 100;
private _newTarget    = _self call ["newFlankTarget"];
if(_newTarget)exitWith{
    _grpData call ["deleteWaypoints"];
    _grpData call ["enableAttack"];
    _self call ["end",[true]];
};

if(_targetNear)then{
    _self set ["inPosition", true];
    private _wayPoints = _self get "waypoints";
    if(count _wayPoints<2)exitWith{};
    [_group] call SQFM_fnc_groupFlankWp;
    _grpData call ["deleteWaypoints"];

    private _destroyWp = _grpData call ["addWaypoint",[_targetPos, 50,"SAD", "SQFM_fnc_groupEndBattleTask"]];
    _grpData set ["destroyWp",   _destroyWp];
    _grpData set ["waypoints", [_destroyWp]];
    _grpData call ["flashAction", ["Direct attack"]];
    _grpData call ["enableAttack"];
};

private _destroyWp    = _self get "destroyWp";
private _destination  = waypointPosition _destroyWp;
private _distance     = _destination distance2D _targetPos;
if(_distance < 30)exitWith{};

_destroyWp setWaypointPosition [_targetPos,30];

_self    set  ["destination", _targetPos];
_grpData call ["flashAction", ["Updated flank Waypoint"]];

true;