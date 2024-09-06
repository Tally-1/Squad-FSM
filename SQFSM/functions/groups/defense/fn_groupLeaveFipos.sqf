if!(SQFM_SFSM)exitwith{};

private _group   = _self get "grp";
private _men     = units _group; 
private _fipoMen = _self call ["getFipoMen"];

// This will exclude the man from reentering the FIPO for 60(20{cooldown}+40) seconds
{[_x, "lastFipoAttempt", time+40] call SFSM_fnc_unitData}forEach _men;

// This forces them to leave.
{[_x] call SFSM_fnc_getOutFipo}forEach _fipoMen;

true;