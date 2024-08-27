params [
    ["_man", nil, [objNull]]
];
(_man getVariable "FSM_moveParams")
params [
    ["_position",  nil, [[]]]
];

[_man] call SQFM_fnc_fsmMoveHandleTarget;
[_man] call SQFM_fnc_fsmMoveHandleAutoTarget;

private _lastRepeat  = _man getVariable ["FSM_lastOrderRep", time-3];
private _timeSince   = time - _lastRepeat;
private _distance    = _man distance (_man getVariable "FSM_startPos");
private _sinceStart  = time - (_man getVariable "FSM_startTime");
private _wrongOrder  = currentCommand _man isNotEqualTo "SCRIPTED";
private _notMoving   = _sinceStart > 10 && {_distance < 1};
private _repeatOrder = (_wrongOrder||{_notMoving}) &&{_timeSince>2};

if(_repeatOrder)
then{
    _man setVariable ["MoveFsm_Reset", true];
	_man doMove _position;
    sleep 0.1;
	_man commandFSM ["SQFSM\move.fsm", _position, objNull]; 
	private _target  = getAttackTarget _man;
    private _repeats = _man getVariable ["FSM_movesRepeated",0];
    private _msg     = "reordered move (wrong order)";
	
	_man doWatch objNull;
	_man doTarget objNull;
	_man forgetTarget _target;
    _man setVariable ["FSM_lastOrderRep",        time];
    _man setVariable ["FSM_movesRepeated", _repeats+1];

    if(_notMoving)
    then{_msg = "reordered move (not Moving)"};

    [_man, _msg] spawn SQFM_fnc_flashActionMan;

    sleep 0.1;
};

true;