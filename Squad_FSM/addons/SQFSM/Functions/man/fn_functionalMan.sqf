params[
	["_man", nil, [objNull]]
];

if (_man getVariable ["SQFM_Excluded", false]) exitWith{false;};
if!(alive _man)                                exitWith{false;};
if!((side _man) in [west, east, independent])  exitWith{false;};
if!(_man checkAIFeature "PATH")                exitWith{false;};
if!(_man checkAIFeature "MOVE")                exitWith{false;};
if!(_man checkAIFeature "ANIM")                exitWith{false;};
if ([_man] call SQFM_fnc_unconscious)          exitWith{false;};
if!([_man] call SQFM_fnc_isRealMan)            exitWith{false;};


true;