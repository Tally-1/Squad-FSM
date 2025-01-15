params[
    ["_vehicle",nil,[objNull]]
];
private _magazines = getArtilleryAmmo [_vehicle]select{[_x] call SQFM_fnc_isLethalArtyAmmo};
if(_magazines isEqualTo [])exitWith{false};

true;