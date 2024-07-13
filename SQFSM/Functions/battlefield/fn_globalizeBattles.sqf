private _battleList = missionNamespace getVariable "SQFM_battleList";
private _allBattles = missionNamespace getVariable "SQFM_battles";

missionNamespace setVariable ["SQFM_battles",   _allBattles,  true];
missionNamespace setVariable ["SQFM_battleList", _battleList, true];

true;