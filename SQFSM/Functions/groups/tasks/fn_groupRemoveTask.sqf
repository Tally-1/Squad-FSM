private _emptyMap = createHashmapObject[[]];
private _group    = _self get "grp";

[_group] call SQFM_fnc_removeFromTaskList;

_self deleteAt "taskData";
_self set ["taskData", _emptyMap];
_self call ["globalize"];

true;