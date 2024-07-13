private _defaultColor = [0.6,0.6,0.1,1];
private _defaultIcon  = "\A3\ui_f\data\map\markers\handdrawn\dot_CA.paa";
params [
	["_posArr",      nil,           [[]]],
	["_color",       _defaultColor, [[]]],
	["_text",        "",            [""]],
	["_icon",        _defaultIcon,  [""]],
	["_size",        1,              [0]],
	["_maxDistance", 200,            [0]]
];

{
    [_x, _color, _text, _icon] call SQFM_fnc_draw3dMarker;
    
} forEach _posArr;

true;