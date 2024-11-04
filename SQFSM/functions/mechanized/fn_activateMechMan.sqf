params[
	["_man",nil,[objNull]]
];

_man enableAI     "path";
_man setUnitPos   "AUTO";
_man setVariable ["SQFM_suppressionTarget",nil];
_man setAnimSpeedCoef 1;
[_man, true] call SQFM_fnc_manToggleExternalAi;

true;