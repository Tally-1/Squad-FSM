private _pos = _self get "position";
private _rad = _self get "radius";

SQFM_battleList deleteAt (SQFM_battleList find [_pos, _rad]);
SQFM_battles    deleteAt _pos;

missionNamespace setVariable ["SQFM_battles", SQFM_battles];
missionNamespace setVariable ["SQFM_battleList", SQFM_battleList];

_self call ["endGroups"];

[["Battle ended | ", round time]] call dbgm;


call SQFM_fnc_globalizeBattles;
// publicVariable "SQFM_battleList";
// publicVariable "SQFM_battles";
// private _battle    = SQFM_battles get (SQFM_battleList#0#0);
// private _uTime     = _battle get "updateTime";
// private _startTime = _battle get "startTime";
// private _times     = [_startTime, _uTime, _uTime-_startTime, time]apply{round _x};

// _times;

true;