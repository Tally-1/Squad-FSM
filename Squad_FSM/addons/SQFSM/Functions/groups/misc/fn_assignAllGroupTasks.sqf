private _allSentMsg = { "All Available groups have been assigned" call dbgm;nil;};
private _groupMap   = call SQFM_fnc_getCategorizedGroups;

[_groupMap, "recon"] call SQFM_fnc_assignGroupObjectivesAllSides;
if(_groupMap get "all" isEqualTo [])
exitWith _allSentMsg;

[_groupMap, "attackSquads"] call SQFM_fnc_assignGroupObjectivesAllSides;
if(_groupMap get "all" isEqualTo [])
exitWith _allSentMsg;

[_groupMap, "defenseSquads"] call SQFM_fnc_assignGroupObjectivesAllSides;
if(_groupMap get "all" isEqualTo [])
exitWith _allSentMsg;


[_groupMap] call SQFM_fnc_assignAllReinforcements;

if(_groupMap get "all" isEqualTo [])
exitWith _allSentMsg;

"Some groups are still available for tasks." call dbgm;

_groupMap;