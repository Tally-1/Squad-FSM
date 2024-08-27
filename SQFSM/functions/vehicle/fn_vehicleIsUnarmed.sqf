params[
    ["_vehicle",nil,[objNull]]
];
if(_vehicle isKindOf "man")exitWith{false};

private _weapons = [_vehicle] call SQFM_fnc_getVehicleWeapons;
if(_weapons isEqualTo [])exitWith{true};

false;