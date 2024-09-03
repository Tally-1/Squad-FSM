params[
	["_pos",      nil,   [[]]],
	["_value",    nil,    [0]],
    ["_range",    nil,   [[]]],
    ["_onChange", nil,   [{}]]
];
private _slider = _self call ["addCtrl",["RscXSliderH",_pos, true]];
private _ctrl   = _slider get "ctrl";

_ctrl sliderSetRange    _range;
_ctrl sliderSetPosition _value;

if(!isNil "_onChange")then{ 
    _ctrl ctrlAddEventHandler ["SliderPosChanged", _onChange];
    [_ctrl, _value] call _onChange;
};

_slider;