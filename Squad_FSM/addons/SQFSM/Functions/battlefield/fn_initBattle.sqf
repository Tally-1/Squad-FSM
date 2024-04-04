params [
	["_man",    nil, [objNull]],  // a man from the group that spotted the enemy
	["_target", nil, [objNull]]   // The man who was spotted.
];

[["Battle initializing | ", round time]] call dbgm;

private _spotterGroup = group _man;
private _dimensions   = [_man, _target] call SQFM_fnc_battlefieldDimensions;
private _pos          = _dimensions#0;
private _rad          = _dimensions#1;

SQFM_battleList pushBackUnique [_pos, _rad];

private _battleMap = [
	_pos, 
	_rad
] call SQFM_fnc_initBattleMap;

SQFM_battles set [_pos, _battleMap];

_battleMap call  ["initGroups"];
_battleMap call  ["postInit"];