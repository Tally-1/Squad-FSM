params [
	["_man",    nil, [objNull]],  // a man from the group that spotted the enemy
	["_target", nil, [objNull]]   // The man who was spotted.
];
([_man, _target] call SQFM_fnc_battlefieldDimensions)
params[
	["_pos",nil,[[]]],
	["_rad",nil, [0]]
];

SQFM_battleList pushBackUnique [_pos, _rad];

private _battleMap = [
	_pos, 
	_rad
] call SQFM_fnc_initBattleMap;

SQFM_battles set [_pos, _battleMap];

_battleMap call ["initGroups"];
private _client = 0+ clientOwner;

publicVariable "SQFM_battles";
publicVariable "SQFM_battleList";

_battleMap call ["postInit"];

[["Battle initializing | ", round time]] call dbgm;

true;