params[
	["_vehicle",nil,[objNull]]
];
private _group = group player;
private _data  = _group call getData;

_data set  ["transportVehicle",objNull];
_data call ["globalize"];
[
    _vehicle, 
    "SQFM_transportAborted", 
    true
] call setGlobalVar;

true;