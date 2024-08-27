private _vehicles = _self call ["getVehiclesInUse"];
private _unArmed  = _vehicles select {[_x] call SQFM_fnc_vehicleIsUnarmed};

{[_x, true, true] call SQFM_fnc_vehicleEjectCrew} forEach _unArmed;

_unArmed;