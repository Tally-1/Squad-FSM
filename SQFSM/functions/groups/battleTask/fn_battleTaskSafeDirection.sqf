private _group      = _self get "group";
private _grpData    = _group call getData;
private _grpPos     = _grpData call ["getAvgPos"];
private _hostilePos = _self call ["avgHostilePos"];
private _safeDir    = _hostilePos getDir _grpPos;

_safeDir;