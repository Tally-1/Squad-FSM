params[
    ["_self",nil,[createHashmap]]
];
private _methods = [
    ["canSpawn",             SQFM_fnc_reforceModuleCanSpawn],
    ["spawnSquad",         SQFM_fnc_reforceModuleSpawnSquad],
    ["hostileObjective", SQFM_fnc_reforceObjectiveIsHostile],
    ["updateSquads",     SQFM_fnc_reforceModuleUpdateSquads]
];

{_self set [_x#0,_x#1]} forEach _methods;

true;