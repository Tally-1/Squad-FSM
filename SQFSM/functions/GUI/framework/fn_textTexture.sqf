params [
	["_text",            nil,           [""]],
    ["_fontSize",        0.1,            [0]],
    ["_textColor",       "#ffffff",     [""]],
    ["_backgroundColor", "#00000000",   [""]],
    ["_font",            "PuristaBold", [""]],
	["_resolution",      128,            [0]]   // [32,64,128,256,512,1024]
];

private _xPos    = 1;
private _yPos    = 1;
private _rgbPx   = ["#(rgb,",_resolution,",",_resolution,",3)text"]joinString"";
private _texture = [_rgbPx, '(', _xPos,',', _yPos,',"',_font,'",', _fontSize,',"', _backgroundColor,'","', _textColor,'","', _text,'")']joinString'';

_texture;