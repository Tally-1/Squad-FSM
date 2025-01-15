params[
    ["_request", nil,  [[]]],
    ["_squads",  nil,  [[]]],
    ["_assigned",nil,  [[]]],
    ["_side",    nil,[west]]
];
_request params[
    ["_position", nil,      [[]]],
    ["_caller",   nil, [grpNull]],
    ["_time",     nil,       [0]]
];
private _available = _squads select {_x call getData call ["artilleryCanFireAtPos",[_position]]};
private _tryAgain  = _available isEqualTo [];
if(_tryAgain)then{_available = _assigned select {_x call getData call ["artilleryCanFireAtPos",[_position]]}};

private _fail     = _available isEqualTo [];
private _callerId = groupId _caller;
if(_fail)exitWith{ 
    [["Artillery request for ",_callerId," failed"]] call dbgm;
    "No artillery available" call dbgm;
    [_request,false,_side]call SQFM_fnc_artilleryRequestRadioResponse;
    grpNull
};

private _responder   = selectRandom _available;
private _responderId = groupId _responder;
private _data        = _responder call getData;

_data call ["artilleryFireMission",[_position, SQFM_artyRounds, true, false, _caller]];

[[_responderId, " Responding to artillery call"]] call dbgm;
[_request,true,_side]call SQFM_fnc_artilleryRequestRadioResponse;

_responder;