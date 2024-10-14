params [
    ["_man",       nil, [objNull]],
    ["_pos",  nil,      [[]]]
];
private _onArrival = [[_man], SQFM_fnc_manOnIdleCoverArrival];
private _condition = [[_man], SQFM_fnc_validMan];
private _dist      = _man distance2D _pos;
private _timeLimit = _dist+30;
private _high      = (_pos#2)>2;

if(_high)then{_timeLimit=_timeLimit+15};

_man setVariable ["SFSM_Excluded",true,true];
[_man, "Moving to idle Cover position"] spawn SQFM_fnc_flashActionMan;

[
    _man, 
    _pos, 
    _timeLimit, 
    3,
    _onArrival,
    _condition
] call SQFM_fnc_fsmMoveManToPos;

true;