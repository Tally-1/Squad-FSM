private _allSentMsg = { "All Available groups have been assigned" call dbgm};
private _groupMap   = call SQFM_fnc_getCategorizedGroups;
private _groups     = [];

_groups append([_groupMap, "recon", east]        call SQFM_fnc_assignGroupsAndObjectives);
_groups append([_groupMap, "recon", west]        call SQFM_fnc_assignGroupsAndObjectives);
_groups append([_groupMap, "recon", independent] call SQFM_fnc_assignGroupsAndObjectives);

_groupMap call ["removeMultiple",[_groups]];
_groups = [];

if(_groupMap get "all" isEqualTo [])exitWith _allSentMsg;

_groups append([_groupMap, "attackSquads", east]        call SQFM_fnc_assignGroupsAndObjectives);
_groups append([_groupMap, "attackSquads", west]        call SQFM_fnc_assignGroupsAndObjectives);
_groups append([_groupMap, "attackSquads", independent] call SQFM_fnc_assignGroupsAndObjectives);

_groupMap call ["removeMultiple",[_groups]];
_groups = [];

if(_groupMap get "all" isEqualTo [])exitWith _allSentMsg;

_groups append([_groupMap, "defenseSquads", east]        call SQFM_fnc_assignGroupsAndObjectives);
_groups append([_groupMap, "defenseSquads", west]        call SQFM_fnc_assignGroupsAndObjectives);
_groups append([_groupMap, "defenseSquads", independent] call SQFM_fnc_assignGroupsAndObjectives);

_groupMap call ["removeMultiple",[_groups]];
_groups = [];

if(_groupMap get "all" isEqualTo [])exitWith _allSentMsg;

// "Some groups are still available for tasks." call dbgm;