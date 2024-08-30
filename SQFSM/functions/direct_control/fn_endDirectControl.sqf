if(isNil "SQFM_dcUnit")
exitWith{false};
private _dead = (damage SQFM_dcUnit)>=0.999;

[_dead] call SQFM_fnc_switchUnit_exit;

true;