private _hostiles      = _self get "hostiles";
private _positionsHost = _hostiles apply {_x call getData call ["getAvgPos"]};
private _avgHostilePos = [_positionsHost] call SQFM_fnc_avgPos2D;

_avgHostilePos;