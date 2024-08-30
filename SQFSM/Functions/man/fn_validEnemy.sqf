params[
	["_entity",   nil, [objNull]],
	["_target", nil, [objNull]]
];
if!([_entity, _target] call SQFM_fnc_hostile) exitWith{false};
if!([_target] call SQFM_fnc_validLandEntity)  exitWith{false};

true;