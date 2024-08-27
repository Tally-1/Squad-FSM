params[
    ["_scripts",   nil,[[]]],
    ["_timeLimit", nil, [0]],
    ["_frequency", 1,   [0]]
];
if(_scripts isEqualTo [])exitWith{true};

private _timer = time + _timeLimit;
waitUntil { 
    sleep _frequency;
    private _complete = [_scripts] call SQFM_fnc_scriptListDone;
    private _timedOut = time >= _timer;
    (_complete || {_timedOut})
};

true;