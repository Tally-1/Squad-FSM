params[
	["_group",nil,[grpNull]]
];
private _valid = [_group] call SQFM_fnc_validGroup;
if!(_valid)exitWith{false};

private _data = _group call getData;
if(isNil "_data")exitWith{false};

private _canHunt = _data call ["ableToHunt"];
if!(_canHunt)exitWith{false};

true;