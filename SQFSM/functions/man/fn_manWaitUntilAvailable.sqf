params[
    ["_man",       nil, [objNull]],
    ["_timeLimit", 10,        [0]]
];
private _timer = time+_timeLimit;
waitUntil{
    sleep 0.1;
    private _available = [_man] call SQFM_fnc_manIsAvailableOrInvalid;
    if(_available)exitWith{true};
    private _timeOut = time>_timer;
    if(_timeOut)exitWith{true};
    false;
};

private _available = [_man] call SQFM_fnc_manIsAvailableOrInvalid;

_available;