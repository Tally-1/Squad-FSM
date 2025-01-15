_self spawn{
if(!SQFM_showArtyChat) exitWith{};
if(SQFM_artyDelay < 6) exitWith{};
private _self       = _this;
private _targetName = _self get "targetName";
private _text       = ["Artillery preparing to fire at ", _targetName]joinstring"";
private _gunner     = _self get "gunner";

sleep (1+random 2);
[_gunner, _text] remoteExecCall ["sideChat"];

true;
};