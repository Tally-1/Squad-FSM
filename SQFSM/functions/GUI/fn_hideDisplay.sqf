{
	private _data = _x getVariable "data";
	if(!isNil "_data")then{_data call ["hide"]};
	
} forEach (_self get "controls");

_self set ["hidden", true];

true;