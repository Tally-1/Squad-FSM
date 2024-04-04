params[
	["_men",      nil, [[]]],
	["_vehicles", nil, [[]]]
];
private _assignedMen = [];
_vehicles = _this call SQFM_fnc_sortTravelVehicleList;

{
	private _availableMen = _men select {!(_x in _assignedMen)};

	if(_availableMen isEqualTo [])exitWith{};

	private _menOrderedIn = [_availableMen, _x] call SQFM_fnc_menGetInSingleVehicle;
	_assignedMen insert [0, _menOrderedIn, true];

	private _msg = [count _menOrderedIn, " Ordered to board", typeOf _x]joinString"";
	_msg call dbgm;

} forEach _vehicles;

true;