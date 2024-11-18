private _pos = _self get "position";
private _rad = _self get "radius";

SQFM_battleList deleteAt (SQFM_battleList find [_pos, _rad]);
SQFM_battles    deleteAt _pos;

_self call ["endGroups"];

[["Battle ended | ", round time]] call dbgm;

[missionNamespace,"SQFM_battles",SQFM_battles]       call setGlobalVar;
[missionNamespace,"SQFM_battleList",SQFM_battleList] call setGlobalVar;

true;