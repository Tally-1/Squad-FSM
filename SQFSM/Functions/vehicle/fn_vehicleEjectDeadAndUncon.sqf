params[
	["_vehicle", nil, [objNull]]
];
{
	private _eject = (!alive _x) or {[_x] call SQFM_fnc_unconscious};
	if(_eject)then{
		_x action ["Eject", _vehicle];
		_x leaveVehicle _vehicle;
	};
	
} forEach crew _vehicle;

true;