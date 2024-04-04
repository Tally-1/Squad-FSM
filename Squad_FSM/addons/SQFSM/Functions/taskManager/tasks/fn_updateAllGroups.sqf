{
	private _data = _x getVariable "SQFM_grpData";
	if((!isNil "_data")
	&&{[_x] call SQFM_fnc_validGroup})
	then{
		_data call ["setGroupCluster"];
		_data call ["setGroupType"];
	};
	
} forEach allGroups;