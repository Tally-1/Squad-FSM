private _emptyMap  = createHashmapObject[[]];
private _ownerData = _self call ["ownerData"];

_self call ["endCode"];

_ownerData deleteAt "taskData";
_ownerData set ["taskData", _emptyMap];

true;