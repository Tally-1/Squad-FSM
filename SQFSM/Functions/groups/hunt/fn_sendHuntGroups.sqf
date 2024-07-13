{
	private _canHunt = [_x] call SQFM_fnc_isHuntGroup;
	private _data    = _x call getData;

	if(_canHunt)
	then{_data call ["initHunt"]};
	
} forEach allGroups;

true;