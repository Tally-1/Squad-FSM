params[
	["_man", nil, [objNull]]
];

if!(alive _man)                      exitWith{false;};
if([_man] call SQFM_fnc_unconscious) exitWith{false;};

private _vehicle = assignedVehicle _x;
if(isNull _vehicle) exitWith{false;};

// assignedVehicleRole _man
// params["_role", "_turretPath"];

private _maxDist = SQFM_boardTeleportDist+30;
private _inDist  = _man distance2D _vehicle < _maxDist;
if!(_inDist)exitWith{false;};

_man moveInAny _vehicle;

true;