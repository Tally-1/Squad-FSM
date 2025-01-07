private _startTime  = _self get "startTime";
private _taskTime   = time - _startTime;
private _recentTask = _taskTime<120;
if(_recentTask)exitWith{false};

private _group        = _self get "group";
private _grpData      = _group call getData;
private _target       = _self get "target";
private _nearEnemy    = _grpData call ["nearEnemyGrp"];
private _newEnemy     = _target != _nearEnemy;
if(!_newEnemy)exitWith{false};

private _targetData   = _target call getData;
private _enemyData    = _nearEnemy call getData;
private _grpPos       = _grpData call ["getAvgPos"];
private _targetPos    = _targetData call ["getAvgPos"];
private _enemyPos     = _enemyData  call ["getAvgPos"];
private _targetDist   = _targetPos distance2D _grpPos;
private _enemyDist    = _targetPos distance2D _grpPos;
private _diff         = [_targetDist, _enemyDist] call SQFM_fnc_numDiff;
if(_diff < 70)exitWith{false};

true;