params[
    ["_position", nil,      [[]]],
    ["_caller",   nil, [grpNull]]
];
private _side        = side _caller;
private _requestList = SQFM_artilleryRequests get _side;
private _reqGroups   = _requestList apply {_x#1};
private _request     = [_position, _caller, round time];
private _doubleReq   = _caller in _reqGroups;

if(_doubleReq)
exitWith{"Artillery request ignored, caller is already in list" call dbgm};


_requestList pushBackUnique _request;
"Request for artillery registered" call dbgm;

[
    missionNamespace, 
    "SQFM_artilleryRequests", 
    SQFM_artilleryRequests
] call setGlobalVar;