private _strengthCoef = _self call ["strengthCoef"];
if(_strengthCoef >= 1)exitWith{false};

private _men   = _self call ["getUnits"] select {[_x] call SQFM_fnc_validMan};
private _count = count _men;

// 2-4 man squads should join other squads sooner than at 25% capacity
if(_count <= 2)           exitWith{true};
if(_strengthCoef <= 0.25) exitWith{true};

false;