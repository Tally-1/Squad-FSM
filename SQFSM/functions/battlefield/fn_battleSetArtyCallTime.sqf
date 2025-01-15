params[
    ["_side",nil,[east]]
];
if(_side isEqualTo east)        then{_self set ["eastLastArtyCall", round time]};
if(_side isEqualTo independent) then{_self set ["guerLastArtyCall", round time]};
if(_side isEqualTo west)        then{_self set ["westLastArtyCall", round time]};

true;