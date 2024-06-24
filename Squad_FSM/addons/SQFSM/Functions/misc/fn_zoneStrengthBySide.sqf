params[
    ["_zone",   nil,[[]]],
    ["_groups", nil,[[]]]
];

if(isNil "_groups")
then{_groups = _zone call SQFM_fnc_groupsInZone};

private _strengthEast = 0;
private _strengthGuer = 0;
private _strengthWest = 0;

{
    private _strength = _x call getData call ["getStrength"];
    private _side     = side _x;
    if(_side isEqualTo east)        then{_strengthEast = _strengthEast+_strength};
    if(_side isEqualTo independent) then{_strengthGuer = _strengthGuer+_strength};
    if(_side isEqualTo west)        then{_strengthWest = _strengthWest+_strength};
    
} forEach _groups;


private _friendlyStrength = { 
params[["_ownSide",nil,[west]]];
private _ownStrength = 0;
{
    if(typeName _x isEqualTo "SIDE"
    &&{!([_ownSide, _x]call SQFM_fnc_hostile)})
    then{_ownStrength = _ownStrength+_y};
  
} forEach _self;

_ownStrength;
};

private _enemyStrength = { 
params[["_ownSide",nil,[west]]];
private _enemyStrength = 0;
{
    if(typeName _x isEqualTo "SIDE"
    &&{[_ownSide, _x]call SQFM_fnc_hostile})
    then{_enemyStrength = _enemyStrength+_y};
  
} forEach _self;

_enemyStrength;
};

private _strengthCoef = { 
params[["_ownSide",nil,[west]]];
private _enemyStrength = _self call ["enemyStrength",    [_ownSide]];
private _ownStrength   = _self call ["friendlyStrength", [_ownSide]];
private _totalStrength = _enemyStrength+_ownStrength;

if(_enemyStrength isEqualTo 0) exitWith{1};
if(_ownStrength isEqualTo 0)   exitWith{-1};
private _coef = _ownStrength/_totalStrength;

_coef;
};

private _dataArr = [
    [east,                   _strengthEast],
    [independent,            _strengthGuer],
    [west,                   _strengthWest],

                  /*METHODS*/
    ["friendlyStrength", _friendlyStrength],
    ["enemyStrength",       _enemyStrength],
    ["strengthCoef",         _strengthCoef]
];

private _map = createHashmapObject [_dataArr];

_map;