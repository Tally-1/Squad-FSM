private _emptyMap = createHashmapObject[[]];
private _group = _self get "grp";

_self deleteAt "taskData";
_self set ["taskData", _emptyMap];

SQFM_taskGroups deleteAt (SQFM_taskGroups find _group);

true;