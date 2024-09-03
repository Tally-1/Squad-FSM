params[
	["_man",   nil, [objNull]],
	["_enemy", nil, [objNull]]
];
if!([_man, _enemy] call SQFM_fnc_hostile) exitWith{false};
if!([_enemy] call SQFM_fnc_validLandEntity)  exitWith{false};

true;