params[
    ["_vehicle", nil, [objNull]]
];
private _description = [_vehicle] call objScan_fnc_vehicleType;
private _isCar       = ("car"in _description or{"MRAP"in _description or{"truck"in _description}});
private _armed       = "("in _description;
private _isArmedCar  = _isCar&&{_armed};

_isArmedCar;