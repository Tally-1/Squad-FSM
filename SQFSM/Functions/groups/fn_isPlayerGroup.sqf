params[
	["_group",nil,[grpNull]]
];
private _playerGroup = false;
{
	if([_x] call SQFM_fnc_isPlayer)
	exitWith{_playerGroup = true};
	
} forEach (units _group);

_playerGroup;