params[
    ["_ownSide",  nil, [objNull,west,grpNull,createHashmap]],
    ["_zone",     nil,                                 [[]]]
];
_zone params["_pos","_rad"];
private _enemies  = [];

{
    if([_x] call SQFM_fnc_validLandEntity
    &&{[_ownSide,_x] call SQFM_fnc_hostile})
    then{_enemies pushBackUnique _x};
    
} forEach (_pos nearEntities ["land", _rad]);

_enemies;