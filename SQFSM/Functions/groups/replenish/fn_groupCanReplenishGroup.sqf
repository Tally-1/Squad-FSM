params[
    ["_targetGrp",nil,[grpNull]]
];
private _grp = _self get "grp";

if(isNil "_targetGrp")           exitWith{false};
if(isNull _targetGrp )           exitWith{false};
if(_grp isEqualTo _targetGrp)    exitWith{false};
if!(_self call ["canReplenish"]) exitWith{false};
if (_self call["isPlayerGroup"]) exitWith{false};

private _targetData = _targetGrp call getData;
if!(_targetData call ["canBeReplenished"]) exitWith{false};
if (_targetData call["isPlayerGroup"])     exitWith{false};

private _hostile = [_grp, _targetGrp] call SQFM_fnc_hostile;
if(_hostile)exitWith{false};

private _ownPos    = _self       call ["getAvgPos"];
private _targetPos = _targetData call ["getAvgPos"];
private _dist      = _ownPos distance _targetPos;
if(_dist > SQFM_replenishDistance)exitWith{false};

private _ownClass    = _self get "squadClass";
private _targetClass = _targetData get "squadClass";
if(_ownClass isEqualTo "recon"
&&{_targetClass isNotEqualTo "recon"})exitWith{false};

if(_targetClass isEqualTo "recon"
&&{_ownClass isNotEqualTo "recon"})exitWith{false};

true;