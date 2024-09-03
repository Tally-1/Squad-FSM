params [
	["_text",            nil,           [""]],
    ["_fontSize",        0.1,            [0]],
    ["_textColor",       "#ffffff",     [""]],
    ["_backgroundColor", "#00000000",   [""]],
    ["_font",            "PuristaBold", [""]]	
];
private _texture = _this call SQFM_fnc_textTexture;
_self call ["setImage", [_texture]];

true;