params[
	["_pos",   nil, [[]]],
	["_text",  nil, [""]]
];
private _textBox = _self call ["addCtrl", ["RscStructuredText",_pos]];
private _color   = [1,1,1,1];
_textBox  set ["setBackgroundColor", SQFM_fnc_setTextBoxBackgroundColor];
_textBox call ["setTextColor",[_color]];


if(!isNil "_text")
then{_textBox call ["setText", [_text]]};

_textBox;