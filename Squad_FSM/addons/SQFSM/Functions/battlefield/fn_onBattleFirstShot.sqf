params[
	["_shooter",    nil, [objNull]],
	["_projectile", nil, [objNull]],
	["_target",     nil, [objNull]]
];

if(isNull _target)exitWith{};
private _targetData = (group _target) getVariable "SQFM_grpData";
if(isNil "_targetData")exitWith{
	_projectile setVariable ["SQFM_firstBullet", _self];
};

_self set ["shotsFired", true];
_targetData call ["returnFire", [_shooter]];