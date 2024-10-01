params[
    ["_module",  nil,[objNull]],
    ["_trigger", nil,[objNull]]
];
private _triggerPos = getPosATLVisual _trigger;
private _data       = _module call getData;
private _group      = _data call ["spawnSquad"];
private _groupData  = _group call getData;

_groupData call ["reinforce", [_triggerPos,_trigger,round time]];

true;