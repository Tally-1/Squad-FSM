params[
    ["_abortStatus","",[""]]
];
private _grpData     = _self call ["ownerData"];
private _battleAbort = _abortStatus isEqualTo "battleTask";
if(_battleAbort)
exitWith{_grpData call ["battleAbortObjective"]};

true;