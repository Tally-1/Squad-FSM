params[
    ["_group",nil,[grpNull]]
];
private _alpha = 1;
private _color = [1,1,1,_alpha];
private _side  = side _group;

if(_side isEqualTo east)        exitWith{[1,0.3,0.3,_alpha]};
if(_side isEqualTo west)        exitWith{[0.1,0.1,1,_alpha]};
if(_side isEqualTo independent) exitWith{[0.3,1,0.3,_alpha]};

_color;