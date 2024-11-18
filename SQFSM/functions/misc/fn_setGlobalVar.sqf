params[
	["_nameSpace", nil, [missionNamespace,objNull,grpNull]],
	["_varName",   nil,                               [""]],
	"_value",
	["_jip",       false,                          [false]]
];

if(isNil "_value")exitWith{
	_nameSpace setVariable [_varName,nil, _jip];
	[_nameSpace,[_varName,nil]] remoteExec ["setVariable"];
};

_nameSpace setVariable [_varName,_value, _jip];
[_nameSpace,[_varName,_value]] remoteExec ["setVariable"];

true;