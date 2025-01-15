params [
	["_ignoreTime",nil,[true]]
];
private _class = _self get "squadClass";
private _valid = _class isEqualTo "recon";
if(!_valid)exitWith{};

private _timeSinceLast = time - (_self get "lastReconUpdate");
private _tooSoon       = _timeSinceLast < 59 && {!_ignoreTime};
if(_tooSoon)exitWith{};

_self set ["lastReconUpdate", round time];

private _group       = _self get "grp";
private _excluded	= _group getVariable ["SQFM_excluded",false];
if(_excluded)exitWith{};


private _enemies = _self call ["nearKnownEnemies", [1000]];


_self call ["reconDangerMode",[_enemies]];
_self call ["reconCallArty",  [_enemies]];

true;