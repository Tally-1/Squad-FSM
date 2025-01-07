private _battle     = _self get "battle";
private _group      = _self get "group";
private _grpData    = _group call getData;
private _status     = _grpData call ["getBattleStatus",[_battle]];
private _oldStatus  = _self get "status";

// If there is no status change then there is no need to reset the task.
if(_status isEqualTo _oldStatus)exitWith{false};

// To prevent Switch spamming the current task must have been active
// for at least 1 minute.
private _startTime  = _self get "startTime";
private _taskTime   = time - _startTime;
if(_taskTime>120)exitWith{true};

// In the beginning the first exchange of fire may change the status too
// quickly making the spam-block impede the squads survivability.
private _battleTime = time - (_battle get "startTime");
if(_battleTime<120)exitWith{true};

// It is very unlikely that a side with less than half of the enemy
// strength will be able to turn it around in less than 1 minute.
private _side = _grpData get "side";
private _strength = [_battle, _side] call SQFM_fnc_getBattleStrength;
if(_strength<0.3)exitWith{true};

false;