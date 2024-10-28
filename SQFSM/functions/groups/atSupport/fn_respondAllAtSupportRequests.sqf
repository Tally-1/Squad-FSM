private _responders   = [];
private _requestCount = 0;
{
    private _side     = _x;
    private _requests = SQFM_atSupportRequests get _side;
    {
        _x params[
            ["_caller",     nil, [grpNull]],
            ["_target",     nil, [objNull]],
            ["_time",       nil,       [0]]
        ];
        private _responder = [_caller, _target, _time, _responders] call SQFM_fnc_respondAtSupportRequest;
        private _index     = _requests find _x;

        _responders pushBackUnique _responder;
        _requests deleteAt _index;
        _requestCount=_requestCount+1;
    } forEach _requests;
    
} forEach [east,west,independent];

if(_requestCount>0)
then{[["Handled ",_requestCount," AT-support request(s)"]] call dbgm};


true;