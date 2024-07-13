params[
    ["_groupsMap", nil, [createHashmap]]
];

if(isNil "_groupsMap")
then{_groupsMap = call SQFM_fnc_getCategorizedGroups};

private _groups = [];

_groups append([_groupsMap, east]        call SQFM_fnc_assignReinforcementsBySide);
_groups append([_groupsMap, independent] call SQFM_fnc_assignReinforcementsBySide);
_groups append([_groupsMap, west]        call SQFM_fnc_assignReinforcementsBySide);

_groupsMap call ["removeMultiple",[_groups]];

call SQFM_fnc_initReinforRequestsMap;

_groupsMap;