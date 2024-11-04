params[
	["_nameSpace", nil, [missionNamespace,objNull,grpNull]],
	["_varName",   nil,                               [""]],
	"_value"
];

if(isNil "_value")exitWith{
	_nameSpace setVariable [_varName,nil,true];
	[_nameSpace,[_varName,nil]] remoteExec ["setVariable"];
};

_nameSpace setVariable [_varName,_value,true];
[_nameSpace,[_varName,_value]] remoteExec ["setVariable"];

true;