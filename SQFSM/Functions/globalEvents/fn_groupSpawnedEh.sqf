addMissionEventHandler ["GroupCreated", {
	params [
		["_group", nil, [grpNull]]
	];

	SQFM_newGroups pushBackUnique _group;
	[_group, true] spawn SQFM_fnc_initGroup;

	true;
}];

true;