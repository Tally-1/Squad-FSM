params[
	["_pos",      nil,         [[]]],
    ["_text",     nil,         [""]],
	["_value",    nil,          [0]],
    ["_range",    nil,         [[]]],
    ["_onChange", {},          [{}]],
    ["_color",    [1,1,1,1],   [[]]]
];
private _textBox   = _self call ["addTextBox",             [_pos, _text]];
private _frame     = _self call ["addFrame",   [_pos, "", _color, false]];
private _width     = (_pos#2)*0.5;
private _height    = (_pos#3)*0.8;
private _diffH     = ((_pos#3)-_height)/2;
private _sliderPos = [
    (_pos#0)+(_pos#2)-(_width*1.5),
    (_pos#1)+_diffH,
    _width,
    _height
];
private _slider    = _displayData call ["addSlider", [_sliderPos, _value,_range, _onChange]];
private _ctrlGroup = [_textBox, _frame, _slider];

{(_x get "ctrl") setVariable ["SQFM_controlGroup", _ctrlGroup]} forEach _ctrlGroup;

_ctrlGroup;