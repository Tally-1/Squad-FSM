params [
	["_group", nil, [grpNull]]
];
if!(side _group in SQFM_validSides)exitWith{};

[["Initializing group ", _group, " ", count units _group]] call dbgm;

[_group] call SQFM_fnc_initGroupData;
[_group] call SQFM_fnc_grpEvents;

true;