params[
	["_group",nil,[grpNull]]
];
private _playerGroup = false;
{
	if(_x in allPlayers)
	exitWith{_playerGroup = true;};
	
} forEach (units _group);

_playerGroup;