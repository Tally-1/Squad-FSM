params[
    ["_groups",nil,[[]]]
];
private _invalidGroups = _groups select {(!isNull _x)&& {!([_x] call SQFM_fnc_validGroup)}};
{
	private _grpData = _x getVariable "SQFM_grpData";
	if(!isNil "_grpData")
	then{_grpData call ["battleEnd"]};
	
} forEach _invalidGroups;

true;