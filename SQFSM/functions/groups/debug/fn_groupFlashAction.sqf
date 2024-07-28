params[
    ["_text",  nil,      [""]],
    ["_color", "#00ffff",[""]],
    ["_time",  3,         [0]]
];
private _length = count _text;
private _coef   = 4 /_length;
private _font   = "puristaBold";
private _3Dtxt  = [_text, _coef, _color,nil,_font]call SQFM_fnc_getTextTexture;

_self set ["strengthIndicator", _3Dtxt];

[_self, _time] spawn{
    sleep (_this#1);
    (_this#0) call ["setStrengthIcon"];
};
 
true;