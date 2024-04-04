params [
	["_group", nil, [grpNull]]
];
private _man = objNull;
{
	if(!isNull _man)exitWith{};
	if([_x] call SQFM_fnc_functionalMan)
	exitWith{_man = _x;};
	
} forEach (units _group);

_man;