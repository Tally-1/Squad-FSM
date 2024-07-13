params[
	["_entity", nil, [objNull]]
];

if([_entity] call SQFM_fnc_functionalMan isEqualTo false
&&{[_entity] call SQFM_fnc_validVehicle  isEqualTo false})
exitWith{false;};


true;