params[
	["_key",   nil, [""]],
	["_value", nil]
];

{
	private _data = _x getVariable "SQFM_grpData";
	if(!isNil "_data")
	then{
		_data set [_key, _value];
	};
	
} forEach allGroups;

true;