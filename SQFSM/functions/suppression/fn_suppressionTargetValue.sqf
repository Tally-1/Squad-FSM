/*
    Assigns a value to a suppression target.
    Used to prioritize targets when suppressing an area.
    Position    = 1
    House       = 2
    Man         = 3
    Car         = 4
    At-Man      = 5
    Light Armor = 6
    Heavy Armor = 7
*/
params[ 
    ["_target",nil,[[],objNull]] // can be a position (ASL) or an object (man, vehicle or house)
];
if(typeName _target isEqualTo "ARRAY") exitWith{1};
if(_target isKindOf "HOUSE")           exitWith{2};
if(!alive _target)                     exitWith{0};

private _description = ([_target] call SQFM_fnc_vehicleDescription)#1;
private _isMan       = _target isKindOf "caManBase";
private _isAtMan     = _isMan &&{secondaryWeapon _target isNotEqualTo ""};
private _isInf       = _isMan &&{!(_isAtMan)};
if(_isInf)exitWith{3};

private _light = _description isEqualTo "light vehicle";
if(_light)   exitWith{4};
if(_isAtMan) exitWith{5};

private _medium = _description isEqualTo "light armor";
if(_medium) exitWith{6};

private _heavy = _description isEqualTo "heavy armor";
if(_heavy) exitWith{7};

0;