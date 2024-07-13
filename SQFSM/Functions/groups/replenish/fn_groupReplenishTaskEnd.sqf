private _grpData     = _self call ["ownerData"];
private _group       = _grpData get "grp";
private _targetGroup = (_self get "params")#0;
private _targetData  = _targetGroup call getData;
private _valid       = [_targetGroup] call SQFM_fnc_validGroup && {[_group] call SQFM_fnc_validGroup};

_targetData set ["awaitingReplenish", false];

if!(_valid)exitWith{};

private _joined = _grpData call ["replenishDirect",[_targetGroup, 200]];
if(_joined)exitWith{};

"Group replenishment failed" call dbgm;

true;