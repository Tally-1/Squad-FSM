params[
	["_group",nil,[grpNull]]
];
private _data = _group call getData;
// private _transportVehicle = _data get "";

_data call ["onArrival"];
_data set ["travelData", nil];

"Group arrived at destination" call dbgm;

true;