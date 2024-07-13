params ["_group"];
if(isNull _group)
exitWith{false;};

if(typeName _group isNotEqualTo "GROUP")
exitWith{false;};

if!(side _group in [east,west,independent])
exitWith{false;};

private _validGroup = false;
{
	if(_validGroup)exitWith{};

	if(alive _x && {!([_x] call SQFM_fnc_unconscious)})
	exitWith{_validGroup = true;};
	
} forEach units _group;


_validGroup;