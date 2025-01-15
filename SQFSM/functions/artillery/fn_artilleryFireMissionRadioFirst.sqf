if(!SQFM_showArtyChat)exitWith{};
private _vehicle    = _self get "vehicle";
private _targetPos  = _self get "targetPos";
private _targetName = _self get "targetName";
private _count      = _self get "countTotal";
private _magazine   = _self get "magazine";
private _eta        = round (_vehicle getArtilleryETA [_targetPos, _magazine]);
private _text       = ["Firing ",_count," rounds at ", _targetName,". Splash in ",_eta, " seconds."]joinstring"";
private _gunner     = _self get "gunner";

if(_eta < 0)exitWith{};

[_gunner, _text] remoteExecCall ["sideChat"];

true;