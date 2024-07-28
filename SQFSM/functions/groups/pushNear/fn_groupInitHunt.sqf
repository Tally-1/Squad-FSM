private _group      = _self get "grp";
private _pos        = _self call ["getAvgPos"];
private _range      = _self get "huntDistance";
private _knowsabout = (_self get "huntKnowledge")*4;
private _zone       = [_pos, _range];
private _enemies    = [_group, _zone, _knowsabout] call SQFM_fnc_enemiesInZone;
if(_enemies isEqualTo [])exitWith{};

private _nearest   = [_pos, _enemies] call SQFM_fnc_getNearest;
private _enemyGrp  = group _nearest;
private _enemydata = _enemyGrp call getData;


_self call ["initHuntTask",[_enemyGrp]];