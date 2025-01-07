private _grpData   = _self get "group" call getData;
private _grpPos    = _grpData call ["getAvgPos"];
private _enemy     = _grpData call ["nearEnemyGrp"];
private _battlePos = _self get "battle" get "position";
private _battleDir = _grpPos getDir _battlePos;
if(isNull _enemy)exitWith{_battleDir};

private _enemyPos = _enemy call getData call ["getAvgPos"];
private _enemyDir = _grpPos getDir _enemyPos;

_enemyDir;