params[
    ["_man",nil,[objNull]]
];

private _role   = _self get "vehicleRole";
if(_role isEqualTo [])         exitWith{};

private _vehicle = _self call ["getVehicle"];
if(!alive _vehicle)            exitWith{"No vehicle found" call dbgm};
if(_role isEqualTo ["driver"]) exitWith{_man moveInDriver _vehicle};
if("cargo" in _role)           exitWith{_man moveInCargo _vehicle};

private _turret = _role#1;
_man moveInTurret [_vehicle, _turret];

true;