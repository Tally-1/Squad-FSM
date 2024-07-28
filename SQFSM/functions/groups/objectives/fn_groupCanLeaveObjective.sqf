private _objective = _self get "objective";
if(isNull _objective)exitWith{true};

private _side    = _self get "side";
private _objData = _objective call getData;
private _hostile = count ((_objData call ["getSidesInZone"])select{[_x,_side]call SQFM_fnc_hostile})>0;
if(_hostile)exitWith{false};

private _hostileStrength = _self call ["objectiveAssignedHostiles",[_objective]];
if(_hostileStrength > 1)exitWith{false};

true;