params[
    ["_groups",nil,[[]]]
];
private _pos        = _self get "position";
private _oldGroups  = _self get "groups" select {[_x] call SQFM_fnc_validGroup};
private _newGroups  = _groups select {(!(_x in _oldGroups)) && {[_x] call SQFM_fnc_validGroup}};
{
	private _grpData = _x getVariable "SQFM_grpData";
	if(!isNil "_grpData")
	then{_grpData call ["battleInit", [_pos]]};
	
} forEach _newGroups;

true;