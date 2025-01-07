private _travelData = _self get "travelData";
if(isNil "_travelData")exitWith{false};

private _vehicle = _self get "transportVehicle";
if(isNil "_vehicle") exitWith{false};

private _trGroup = group driver _vehicle;
if(isNil "_trGroup") exitWith{false};
if(isNull _trGroup)  exitWith{false};

private _group   = _self get "grp";
private _ownVeh = _trGroup isEqualTo _group;
if(_ownVeh)exitWith{false};

private _loaded  = _vehicle in (_self call ["getGrpMembers"]);
if(_loaded)then{
    private _unload = [_group, false] call SQFM_fnc_onPassengerCombatDrop;
    waitUntil { scriptDone _unload};
}
else{[_trGroup] call SQFM_fnc_onTransportCombatDrop};

_self deleteAt "travelData";
_self deleteAt "transportVehicle";

true;