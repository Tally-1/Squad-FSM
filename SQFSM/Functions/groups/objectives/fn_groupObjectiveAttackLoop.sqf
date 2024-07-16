private _group        = _self get "grp";
private _ownSide      = _self get "side";
private _ownPos       = _self call ["getAvgPos"];
private _objModule    = _self get "objective";
private _objData      = _objModule call getData;
private _taskData     = _self call ["getTaskData"];
private _groups       = _objData  call ["getGroupsInZone"];
private _enemyGroups  = _groups select {[_x, _ownSide] call SQFM_fnc_hostile && {[_x] call SQFM_fnc_validGroup}};
private _enemyCount   = count _enemyGroups;

if(_enemyCount < 1)exitWith{
    "No enemies present" call dbgm; 
    _taskData call ["endTask"];
};

_self call ["deleteWaypoints"];
_self set  ["action", "Attacking Enemies inside objective"];

private _enemyPositions = _enemyGroups apply {(_x call getData) call ["getAvgPos"]};
private _nearest        = [_ownPos, _enemyPositions] call SQFM_fnc_getNearest;
private _onCompletion   = '(group this call getData) call ["objectiveAttackLoop"]';
private _wayPoint       = _group addWaypoint [_nearest, 0];

_wayPoint setWaypointType "SAD";
_wayPoint setWaypointStatements ["true", _onCompletion];
_wayPoint setWaypointCompletionRadius 30;

true;