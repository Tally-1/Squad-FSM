{
	private _data = _x getVariable "data";
	if(!isNil "_data")then{_data call ["show"]};
	
} forEach (_self get "controls");

_self set ["hidden", false];

true;