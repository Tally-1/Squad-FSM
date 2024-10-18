params[
    ["_man",  nil, [objNull]],
    ["_pos",  nil,      [[]]],
    ["_stop", false, [false]],
    ["_SFSM", false, [false]]
];
// Use soldier FSM to move the soldier if possible.
if(_SFSM
&&{!isNil "SFSM_fnc_forcedMove"})
exitWith{[_this#0,_this#1] call SFSM_fnc_forcedMove};
private _startTime  = time;
private _timeLimit  = time+(_man distance _pos);
private _ready      = false;
private _repeated   = false;
private _lastRepeat = time;

_man doMove _pos;

waitUntil {
    sleep 0.1;
    private _unitReady  = unitReady _man;
    private _timePassed = time-_startTime;
    private _failed     = currentCommand _man isNotEqualTo "MOVE";
    private _tRepeat    = time - _lastRepeat;
    private _inPlace    = (getPosATLVisual _man) distance2D _pos < 2;
    private _stopped    = _failed||{_unitReady};
    private _repeat     = ((_inPlace == false &&{_stopped})||{(!(_repeated))&&{_timePassed > 5}})&&{_tRepeat > 2};
    private _timedOut   = time > _timeLimit;
    private _endLoop    = _inPlace || {_timedOut};

    if(_repeat)then{
        _man doMove _pos;
        _repeated = true;
    };

    _endLoop;
};

if(_stop)then{doStop _man};

true;