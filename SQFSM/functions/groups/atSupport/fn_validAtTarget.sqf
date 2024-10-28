params[
    ["_target",nil,[objNull]]
];
private _dead = !alive _target;
if(_dead)exitWith{false};

private _inValid = !([_target] call SQFM_fnc_validVehicle);
if(_inValid)exitWith{false};

private _unArmed = [_target] call SQFM_fnc_vehicleIsUnarmed;
if(_unArmed)exitWith{false};


true;