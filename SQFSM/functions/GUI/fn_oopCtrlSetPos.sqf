params[
	["_pos",       nil,     [[]]],
	["_time",      0,        [0]],
	["_onCommitt", "",      [""]],
	["_safe",      false, [true]],
	["_square",    false, [true]]
];
private _ctrl = _self get"ctrl";
// _square means that the width will be adjusted so that the aspect ratio
// does not affect the output size of the element.
if(_square)then{ 
	private _ratio    = _self get "ratio";
	private _width    = _pos#2;
	private _adjusted = _width*_ratio;
	_pos set [2,_adjusted];
};

if(_safe)
then{_pos=[_pos] call SQFM_fnc_setCtrlSafePos};

_ctrl ctrlSetPosition _pos;
_ctrl ctrlCommit _time;

if(isNil "_onCommitt")exitWith{};

// params ["_control", "_animType", "_animTime"];
_ctrl ctrlSetEventHandler ["Committed", _onCommitt];

true;