params [
	["_text",            nil,           [""]],
    ["_fontSize",        0.1,            [0]],
    ["_textColor",       "#ffffff",     [""]],
    ["_backgroundColor", "#00000000",   [""]],
    ["_font",            "PuristaBold", [""]]	
];

private _xPos    = 1;
private _yPos    = 1;
private _rgbPx   = "#(rgb,128,128,3)text";
private _texture = [_rgbPx, '(', _xPos,',', _yPos,',"',_font,'",', _fontSize,',"', _backgroundColor,'","', _textColor,'","', _text,'")']joinString'';

_texture;