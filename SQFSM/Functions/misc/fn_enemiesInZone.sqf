params[
    ["_ownSide",   nil, [objNull,west,grpNull,createHashmap]],
    ["_zone",      nil,                                 [[]]],
    ["_knowledge", nil,                                  [0]]
];
_zone params["_pos","_rad"];
private _enemies      = [];
private _ownType      = typeName _ownSide;
private _knowTypes    = ["OBJECT", "SIDE", "GROUP"];
private _useKnowledge = (!isNil "_knowledge")&&{_ownType in _knowTypes};

{
    private _valid   = [_x] call SQFM_fnc_validLandEntity && {[_ownSide,_x] call SQFM_fnc_hostile};
    private _known   = _valid &&{_useKnowledge isEqualTo false or {(_ownSide knowsAbout _x) >= _knowledge}};
    private _include = _valid &&{_known};
    
    if(_include)then{_enemies pushBackUnique _x};
    
} forEach (_pos nearEntities ["land", _rad]);

_enemies;