if!(SQFM_shareBattleKnowledge)exitWith{};

private _entities = _self get "entities";
{
    [_x, _entities] call SQFM_fnc_updateGroupSideKnowledgeOnTargets;
    
} forEach (_self get "groups");