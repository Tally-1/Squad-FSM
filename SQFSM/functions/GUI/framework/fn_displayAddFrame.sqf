params[
	["_pos",      nil,     [[]]],
	["_text",     nil,     [""]],
	["_color",    nil,     [[]]],
    ["_spawnTxt", false, [true]],
    ["_fontSize", 0.04,     [0]]
];
private _res     = getResolution#5;
private _factor  = 0.56/_res;
private _txtSize = _fontSize*_factor;
private _change  = _txtSize*0.29;

if(_text isEqualTo "")
then{_change = 0};

_pos set [1, (_pos#1)-_change];
_pos set [3, (_pos#3)+_change];

private _frame    = _self call ["addCtrl",["RscFrame",_pos, true]];
private _ctrl     = _frame get "ctrl";

_frame call ["setTextColor", [_color]];
_ctrl ctrlSetFontHeight _txtSize;

[_ctrl] call SQFM_fnc_normalizeTextCtrlHeight;

if!(_spawnTxt)exitWith{
    _frame call ["setText",[_text]];
    _frame;
};

_frame call ["spawnStringText", [_text]];

_frame;