params [
	["_man",    nil, [objNull]],  // a man from the group that spotted the enemy
	["_target", nil, [objNull]]   // The man who was spotted.
];
private _zone   = [_man, _target] call SQFM_fnc_battlefieldDimensions;
private _battle = _zone call SQFM_fnc_posRadInitBattle;


true;