params[
    ["_ownSide", nil, [objNull,west,grpNull,createHashmap]],
    ["_pos",     nil,                                 [[]]],
    ["_range",   150,                                  [0]]
];
private _zone    = [_pos, _range];
private _enemies = [_ownSide, _zone] call SQFM_fnc_enemiesInZone;
if(_enemies isEqualTo [])exitWith{false};

true;