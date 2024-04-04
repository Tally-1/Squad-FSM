params[
	["_vehicle", nil, [objNull]]
];

if!([_vehicle] call SQFM_fnc_isLandVehicle)
exitWith{false;};

if(!alive _vehicle)
exitWith{false;};

if(!canMove _vehicle)
exitWith{false;};

if(fuel _vehicle < 0.05)
exitWith{false;};

if(crew _vehicle isNotEqualTo [])
exitWith{false;};

true;