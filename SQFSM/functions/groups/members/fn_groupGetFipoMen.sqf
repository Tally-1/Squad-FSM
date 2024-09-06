if!(SQFM_SFSM)exitwith{[]};

private _men    = _self call ["getUnitsOnfoot"];
private _inFipo = _men select {[_x] call SFSM_fnc_inFipo};

_inFipo; 