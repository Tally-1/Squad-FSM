private _classS    = _self get "squadClass"; 
private _vehicles  = _self call ["getVehiclesInUse"];
private _infantry  = (_self call ["isInfantrySquad"])||{_vehicles isEqualTo []};
private _recon     = _classS isEqualTo "recon";
private _atSupport = _classS isEqualTo "at_support";
private _standard  = _classS isEqualTo "standard";

if(_infantry)exitwith{
    if(_recon)  exitwith {"recon"};
    if(_atSupport)exitwith {"at-support (Infantry)"};
    "infantry";
};

private _transport  = alive (_self get "transportVehicle");
private _classes    = _vehicles apply {([_x] call SQFM_fnc_vehicleDescription)#0};
private _groupClass = selectMax _classes;
private _classDesc  = [_groupClass] call SQFM_fnc_vehicleClass;
private _mixedGroup = (count(_self call ["nonCrewMen"])>2)or{!(_classS in ["standard", "at_support"])};

if(_mixedGroup)then{
    private _subclass = "infantry";
    if(_recon)     then{_subclass = "recon"};
    if(_atSupport) then{_subclass = "at-support mechanized"};
    if(_transport) then{_subclass = "transport"};
    _classDesc = [_classDesc, " (",_subclass,")"]joinString"";
}
else{
    if(_transport)then{_classDesc = "transport"};
    if(_atSupport)then{_classDesc = ["at-support"," (",_classDesc,")"]joinString""};
};

_classDesc;