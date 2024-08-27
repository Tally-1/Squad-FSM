params[
    ["_man",  nil, [objNull]],
    ["_text", nil,      [""]],
    ["_time",   3,       [0]]
];
private _currentAction = _man getVariable "SQFM_flashActionMan";
private _timer         = time+1;

if(!isNil "_currentAction")then{
    waitUntil { 
        private _ready = (_man getVariable ["SQFM_flashActionMan", ""])isEqualTo "";
        _ready || {time>_timer};
    };
    sleep 0.1;
};

private _timeLimit = time+_time;
_man setVariable ["SQFM_flashActionMan", _text, true];

waitUntil { time>_timeLimit || {_man getVariable ["SQFM_flashActionMan",""] isEqualTo ""}};

_man setVariable ["SQFM_flashActionMan", nil, true];

true;