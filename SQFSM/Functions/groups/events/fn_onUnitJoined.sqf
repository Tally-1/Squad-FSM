params [
	["_group",   nil, [grpNull]],
	["_newUnit", nil, [objNull]]
];
_data = _group call getData;
_data call ["update"];

true;