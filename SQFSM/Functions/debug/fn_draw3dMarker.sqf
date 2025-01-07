private _yellow       = [0.6,0.6,0.1,1];
private _dot        = "\A3\ui_f\data\map\markers\handdrawn\dot_CA.paa";
params[
    ["_position",   nil,    [[]]],
    ["_color",      _yellow,[[]]],
    ["_text",       "",     [""]],
    ["_icon",       _dot,   [""]],
    ["_size",        1,      [0]],
    ["_maxDistance", 500,    [0]]
];

private _distance = (camPos distance _position);
if(_distance > _maxDistance)exitWith{};

drawIcon3D [
    _icon,            
    _color,
    _position,    
    _size,         
    _size,         
    0,              
    _text, 
    2,             
    0.03
];