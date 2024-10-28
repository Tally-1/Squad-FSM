params[
    ["_object",nil,[objNull]]
];
private _vehicle = [_object] call SQFM_fnc_validVehicle;
if!(_vehicle)exitWith{false};

private _armed = [_object] call SQFM_fnc_vehicleIsUnarmed;
if!(_vehicle)exitWith{false};

private _light = [_object] call SQFM_fnc_isLightArmor;
if(_light)exitWith{true};

private _heavy = [_object] call SQFM_fnc_isHeavyArmor;
if(_heavy)exitWith{true};

false;