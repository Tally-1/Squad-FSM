addMissionEventHandler ["GroupCreated", {
	params [
		["_group", nil, [grpNull]]
	];

	SQFM_newGroups pushBackUnique _group;
	[_group] spawn SQFM_fnc_initGroup;

	true;
}];

true;