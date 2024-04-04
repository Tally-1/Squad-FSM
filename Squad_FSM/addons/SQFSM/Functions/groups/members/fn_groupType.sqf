if(_self call ["isInfantrySquad"])exitWith{"infantry";};

private _vehicles   = _self call ["getVehiclesInUse"];
private _classes    = _vehicles apply {([_x] call SQFM_fnc_vehicleDescription)#0};
private _groupClass = selectMax _classes;
private _classDesc  = [_groupClass] call SQFM_fnc_vehicleClass;
private _mixedGroup = count(_self call ["nonCrewMen"])>2;

if(_mixedGroup)then{_classDesc = [_classDesc, " (infantry)"]joinString""};

_classDesc;