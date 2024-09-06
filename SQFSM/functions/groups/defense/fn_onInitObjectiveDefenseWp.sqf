_this spawn{
params[
    ["_group", nil,[grpNull]]
];
private _grpData   = _group call getData;
private _objective = _grpData get "objective";

_grpData call ["forcedMoveEnd"];
_grpData call ["assignObjectiveFipos",   [_objective]];
sleep 3;
_grpData call ["assignObjectiveTurrets", [_objective]];

true;
};
