params[
    ["_targetGrp",nil,[grpNull]]
];
private _grp = _self get "grp";

if(isNil "_targetGrp")           exitWith{false};
if(isNull _targetGrp )           exitWith{false};
if(_grp isEqualTo _targetGrp)    exitWith{false};
if!(_self call ["canReplenish"]) exitWith{false};

private _targetData = _targetGrp call getData;
if!(_targetData call ["canBeReplenished"])exitWith{false};

private _hostile = [_grp, _targetGrp] call SQFM_fnc_hostile;
if(_hostile)exitWith{false};

true;