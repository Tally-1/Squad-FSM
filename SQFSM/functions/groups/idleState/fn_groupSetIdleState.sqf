private _available = _self call ["setLastActionTime"];
// systemChat str[_self get "grp", (_self get "lastActionTime")];

private _timeSinceAction = time - (_self get "lastActionTime");
private _inIdleState     = "idle" in (_self get "state");
if(_timeSinceAction < SQFM_idleStateTimeLimitSeconds)exitWith{
    if(_inIdleState)then{_self set ["state",""]};
    false;
};

_self set ["state","idle"];

true;