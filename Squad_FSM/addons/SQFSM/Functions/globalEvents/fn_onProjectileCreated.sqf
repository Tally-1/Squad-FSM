params[
	["_projectile", nil, [objNull]]
]; 
getShotParents _projectile
params[
	["_vehicle", nil, [objNull]], // Source of projectile
	["_shooter", nil, [objNull]]  // Trigger-man 
];

private _group = group _vehicle;
if(isNull _group)exitWith{};

private _data = _group getVariable "SQFM_grpData";
if(isNil "_data")exitWith{};

private _valid = [_group] call SQFM_fnc_validGroup;
if!(_valid)exitWith{};

_data call ["addShot", [_vehicle, _projectile]];

true;