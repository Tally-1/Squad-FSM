params[ 
	["_men",      nil, [[]]],
	["_vehicles", nil, [[]]]
];
private _menInVehicles     = _men select {vehicle _x in _vehicles};
private _crewSizeNeeded    = count _men - count _menInVehicles;
private _crewSizeAvailable = 0;
{
	private _capacity  = [_x] call SQFM_fnc_crewSize;
	private _crewCount = count crew _x;
	_capacity = _capacity-_crewCount;
	_crewSizeAvailable = _crewSizeAvailable+_capacity;
	
} forEach _vehicles;

if(_crewSizeNeeded <= _crewSizeAvailable)exitWith{true;};

false;