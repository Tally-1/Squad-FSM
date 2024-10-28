params[
    ["_targets",   nil,[[]]],
    ["_knowledge", nil, [0]]
];
private _group = _self get "grp";
[
    _group,
    _targets,
    _knowledge
] call SQFM_fnc_updateGroupSideKnowledgeOnTargets;

true;