if(!SQFM_showArtyChat)exitWith{};
private _text   = "Fire mission complete";
private _gunner = _self get "gunner";

if(_eta < 0)exitWith{};

[_gunner, _text] remoteExecCall ["sideChat"];

true;