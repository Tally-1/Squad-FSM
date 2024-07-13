params[
    ["_excluded",[],[[]]] // Objectives excluded from the search
];

_self call ["setGroupCluster"];

private _pos        = _self get"groupCluster"get"position";
private _objectives = (_pos nearEntities ["SQFSM_Objective", SQFM_maxObjectiveRange]);
_objectives = _objectives select{
    _self call ["validObjective", [_x]] &&
    {!(_x in _excluded)}
};

_objectives;