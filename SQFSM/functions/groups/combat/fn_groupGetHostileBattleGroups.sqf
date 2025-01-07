params[
    ["_battle",nil,[createHashmap]]
];
private _side = _self get "side";
if(_side isEqualTo east)        exitWith{_battle get "groupsHostileToEast"};
if(_side isEqualTo independent) exitWith{_battle get "groupsHostileToGuer"};
if(_side isEqualTo west)        exitWith{_battle get "groupsHostileToWest"};

[];