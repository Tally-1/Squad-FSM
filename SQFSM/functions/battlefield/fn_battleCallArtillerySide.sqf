params[
    ["_side",nil,[east]]
];
private _lastCall = _self call ["getArtyCallTime",[_side]];
private _time     = round(time - _lastCall);
private _minTime  = SQFM_artyCallCooldownBattle;
if(_time < _minTime)exitWith{false};

private _callers = (_self get"groups")select{
    private _rightSide = side _x isEqualTo _side;
    private _data      = _x call getData;
    private _canCall   = _rightSide &&{_data call ["canRequestArtillery"]};
    
    _canCall;
};

if(_callers isEqualTo [])exitWith{};

private _hasCalled = false;
{
    if(_hasCalled)exitWith{};
    private _data = _x call getData;
    _hasCalled = _data call ["battleCallArty"];
    
} forEach _callers;

true;