private _group          = _self get "grp";
private _side           = _self get "side";
private _activeCalls    = SQFM_artilleryRequests get _side;
private _artyCallers    = _activeCalls apply {_x#1};
private _requestWaiting = _group in _artyCallers;
if(_requestWaiting)exitWith{"Request" call dbgm; true};

private _stillActive = time < (_self get "artyRequestEnd");
if(_stillActive)exitWith{true};

private _activeArty = _self get "activeArty";
if(isNull _activeArty)exitWith{false};

private _fireMission = _activeArty getVariable "SQFM_fireMission";
if(isNil "_fireMission")exitWith{
    _self set ["activeArty",objNull];
    _self call ["globalize"];
    false;
};

private _ended = _fireMission get "complete";
if(_ended)exitWith{
    _self set ["activeArty",objNull];
    _self call ["globalize"];
    false;
};

private _completed = _fireMission call ["update"];
if(_completed)exitWith{
    _self set ["activeArty",objNull];
    _fireMission call ["end"];
    false;
};

true;