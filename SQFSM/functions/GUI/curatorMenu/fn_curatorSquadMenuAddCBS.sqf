params[
	["_pos",      nil,         [[]]],
    ["_text",     nil,         [""]],
	["_value",    nil,       [true]],
    ["_onChange", {},          [{}]],
    ["_color",    [1,1,1,1],   [[]]]
];
private _textBox   = _self call ["addTextBox",             [_pos, _text]];
private _frame     = _self call ["addFrame",   [_pos, "", _color, false]];
private _checkBoxS = _pos#3;
private _checkBoxPos = [
    (_pos#0)+(_pos#2)-(_checkBoxS*0.55),
    _pos#1,
    _checkBoxS,
    _checkBoxS
];
private _checkBox  = _self call ["addCheckBox", [_checkBoxPos, _value, _onChange]];
private _ctrlGroup = [_textBox, _frame, _checkBox];

{(_x get "ctrl") setVariable ["SQFM_controlGroup", _ctrlGroup]} forEach _ctrlGroup;


_ctrlGroup;