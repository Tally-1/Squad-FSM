private _vehicle   = _self get "vehicle";
private _remaining = _self get "count";
private _completed = _self call ["isCompleted"];

if(_completed)exitWith{_self call ["end"]};


private _reloadCoef = needReload _vehicle;
private _reloadNow  = _reloadCoef isEqualTo 1;
if(_reloadNow)then{
    private _timeLimit = time+60;
    
    _self set ["reloading", true];
    reload _vehicle;

    waitUntil{
        sleep 3;
        private _reloadCoef = needReload _vehicle;
        private _complete   = _reloadCoef isEqualTo 1 || {time>_timeLimit};
        _complete;
    };

    _self set ["reloading", false];
};

private _completed   = _self call ["isCompleted"];
if(_completed)exitWith{_self call ["end"]};

_self call ["globalize"];

false;