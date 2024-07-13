private _grp     = _self get "grp";
private _pos     = _self call ["getAvgPos"];
private _rad     = 500;
private _enemies = [_grp,[_pos, _rad]] call SQFM_fnc_enemiesInZone;
if(_enemies isEqualTo [])exitWith{grpNull};

private _nearest = group ([_pos, _enemies] call SQFM_fnc_getNearest);

_nearest;