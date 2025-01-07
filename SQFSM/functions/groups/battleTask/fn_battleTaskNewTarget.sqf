private _group    = _self get "group";
private _grpData  = _group call getData;
private _grpPos   = _grpData call ["getAvgPos"];
private _hostiles = _self get "hostiles";
if(_hostiles isEqualTo []) exitWith{grpNull};

private _target   = _grpData call ["nearEnemyGrp"];
private _valid    = (!isNull _target)&&{_target in _hostiles};
if(_valid)exitWith{_target};

_hostiles = [_hostiles, [], {(_x call getData call ["getAvgPos"]) distance2D _grpPos}, "ASCEND"] call BIS_fnc_sortBy;
private _target = _hostiles#0;
if(isNil "_target")exitWith{grpNull};

_target;