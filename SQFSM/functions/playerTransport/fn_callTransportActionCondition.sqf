params [
    ["_caller",nil,[objNull]]
];
if(_caller != player)         exitWith{false};
if(player  != vehicle player) exitWith{false};

private _data = group player call getData;
if(isNil "_data")exitWith{false};

private _vehicle = _data get "transportVehicle";
if(!isNull _vehicle)exitWith{false};

true;