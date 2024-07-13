params[
	["_shooter",    nil, [objNull]],
	["_target",     nil, [objNull]]
];

if(isNull _target)exitWith{};
private _targetData = (group _target) getVariable "SQFM_grpData";
if(isNil "_targetData")exitWith{};

_self set ["shotsFired", true];
_targetData call ["returnFire", [_shooter]];