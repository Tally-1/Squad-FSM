private _classS   = _self get "squadClass"; 
private _infantry = _self call ["isInfantrySquad"];
private _recon    = _classS isEqualTo "recon";
private _support  = _classS isEqualTo "support";
private _standard = _classS isEqualTo "standard";

if(_infantry)exitwith{
    if(_recon)  exitwith {"recon"};
    if(_support)exitwith {"support"};
    "infantry";
};

private _transport  = alive (_self get "transportVehicle");
private _vehicles   = _self call ["getVehiclesInUse"];
private _classes    = _vehicles apply {([_x] call SQFM_fnc_vehicleDescription)#0};
private _groupClass = selectMax _classes;
private _classDesc  = [_groupClass] call SQFM_fnc_vehicleClass;
private _mixedGroup = (count(_self call ["nonCrewMen"])>2)or{_classS isNotEqualTo "standard";};

if(_mixedGroup)then{
    private _subclass = "infantry";
    if(_recon)     then{_subclass = "recon"};
    if(_support)   then{_subclass = "support"};
    if(_transport) then{_subclass = "transport"};
    _classDesc = [_classDesc, " (",_subclass,")"]joinString"";
}
else{if(_transport)then{_classDesc = "transport"}};

_classDesc;