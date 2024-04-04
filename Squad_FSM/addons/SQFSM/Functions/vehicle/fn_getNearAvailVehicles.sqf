params[
	["_pos", nil, [[]]],
	["_rad", 200,  [0]]
];
private _vehicles = nearestObjects [_pos, ["Car", "Tank"], _rad] select {[_x] call SQFM_fnc_validAvailableVehicle;};

_vehicles;