if!(SQFM_shareBattleKnowledge)exitWith{};

private _entities = _self get "entities";
private _groups   = _self get "groups";
{
    [_x, _entities] call SQFM_fnc_updateGroupSideKnowledgeOnTargets;
    
} forEach _groups;