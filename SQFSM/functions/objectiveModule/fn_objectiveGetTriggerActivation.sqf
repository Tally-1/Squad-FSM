private _triggers  = _self get "triggers";
private _noTrigger = _triggers isEqualTo [];
if(_noTrigger)exitWith{
    // "No trigger" call dbgm;
    true;
};

private _isActivated = true;

{
	private _active = triggerActivated _x;
	if!(_active)exitWith{_isActivated = false};
	
} forEach _triggers;

_isActivated;