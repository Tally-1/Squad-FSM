{
	private _data = _x getVariable "SQFM_grpData";
	if((!isNil "_data")
	&&{[_x] call SQFM_fnc_validGroup})
	then{_data call ["update"]};
	
} forEach allGroups;