params[
	["_vehicle",nil,[objNull]]
];
if!(_vehicle isKindOf "land") exitWith{false;};
// if!(canMove _vehicle)         exitWith{false;};
if (_vehicle isKindOf "man")  exitWith{false;};

true;