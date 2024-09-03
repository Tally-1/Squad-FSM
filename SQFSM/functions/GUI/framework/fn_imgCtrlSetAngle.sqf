params [
    ["_angle",   nil,  [0]],
	["_time",      0,  [0]],
	["_onCommitt","", [""]]
];
private _ctrl = _self get "ctrl";
if(_time isEqualTo 0)
exitWith{_ctrl ctrlSetAngle[_angle,0.5,0.5,true]};

_ctrl ctrlSetAngle [_angle, 0.5, 0.5, false];
_ctrl ctrlCommit _time;

if(_onCommitt isNotEqualTo "")then{ 
	// params ["_control", "_animType", "_animTime"];
	_ctrl ctrlSetEventHandler ["Committed", _onCommitt];
};

true;