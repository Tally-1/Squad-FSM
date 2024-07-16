params[
	["_group",nil,[grpNull]]
];
private _index = SQFM_taskGroups findIf {(_x#0) isEqualTo _group};

if(_index isEqualTo -1)
exitWith{[["Could not find task registered to ",_group],nil,false,true] call dbgm};

SQFM_taskGroups deleteAt _index;
[["Task removed for: ",_group],nil,false,true] call dbgS;

publicVariable "SQFM_taskGroups";