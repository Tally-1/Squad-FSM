params[
    ["_side",nil,[east]]
];
if(_side isEqualTo east)        exitWith{_self get "eastLastArtyCall"};
if(_side isEqualTo independent) exitWith{_self get "guerLastArtyCall"};
if(_side isEqualTo west)        exitWith{_self get "westLastArtyCall"};

false;