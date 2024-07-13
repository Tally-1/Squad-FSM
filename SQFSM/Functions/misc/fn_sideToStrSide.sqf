params[
    ["_side",nil,[west]]
];
if(_side isEqualTo east)        exitWith{"east"};
if(_side isEqualTo west)        exitWith{"west"};
if(_side isEqualTo independent) exitWith{"independent"};

str _side;