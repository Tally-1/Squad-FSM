params[
	["_group", nil, [grpNull]]
];
private _emptyMap = createHashmapObject[[]];
private _data     = _group call getData;
private _index    = SQFM_taskGroups findIf {(_x#0) isEqualTo _group};

if(_index isEqualTo -1) exitWith{_emptyMap};
if(isNil "_data")       exitWith{_emptyMap};

private _taskData = (SQFM_taskGroups#_index)#1;
_data set ["taskData", _taskData];

[["Task data reapplied for ",_group]] call dbgS;

if(isNil "_index")      exitWith{_emptyMap};

_taskData;