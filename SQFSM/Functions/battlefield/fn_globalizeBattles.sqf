private _battleList = missionNamespace getVariable "SQFM_battleList";
private _allBattles = missionNamespace getVariable "SQFM_battles";

if(SQFM_battlePublicVar)exitWith{ 
publicVariable "SQFM_battleList";
publicVariable "SQFM_battles";
};


// missionNamespace setVariable ["SQFM_battles",    _allBattles, true];
// missionNamespace setVariable ["SQFM_battleList", _battleList, true];

// [missionNamespace,"SQFM_battles",    SQFM_battles,    true] call setGlobalVar;
// [missionNamespace,"SQFM_battleList", SQFM_battleList, true] call setGlobalVar;

[missionNamespace,["SQFM_battleList",_battleList]] remoteExec ["setVariable",-2];
[missionNamespace,["SQFM_battles",   _allBattles]] remoteExec ["setVariable",-2];


// missionNamespace setVariable ["SQFM_battleList",_battleList, true];
// missionNamespace setVariable ["SQFM_battles",_allBattles,    true];

true;