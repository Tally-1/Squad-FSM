params[
	["_men", nil, [[]]]
];
private _vehicles = [];

{
	private _veh = assignedVehicle _x;
	if(!isNull _veh)
	then{_vehicles pushBackUnique _veh};
	
} forEach _men;

_vehicles;