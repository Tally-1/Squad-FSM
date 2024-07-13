params[
    ["_groupMap",  nil,[createHashmap]],
    ["_groupType", nil,           [""]]
];
private _groups = [];

_groups append([_groupMap, _groupType, east]        call SQFM_fnc_assignGroupsAndObjectives);
_groups append([_groupMap, _groupType, west]        call SQFM_fnc_assignGroupsAndObjectives);
_groups append([_groupMap, _groupType, independent] call SQFM_fnc_assignGroupsAndObjectives);

_groupMap call ["removeMultiple",[_groups]];

true;