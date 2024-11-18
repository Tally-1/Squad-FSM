params [
    ["_caller",nil,[objNull]]
];
if(_caller != player)         exitWith{false};
if(player  != vehicle player) exitWith{false};

private _data = group player call getData;
if(isNil "_data")exitWith{false};

true;