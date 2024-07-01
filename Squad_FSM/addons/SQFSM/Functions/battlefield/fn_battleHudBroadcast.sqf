if!(SQFM_debugMode)exitWith{};
private _zone              = _self get "zone";
private _strengthData      = _self get "strengthData";
private _reinforcementData = _self get "reinforData";

[_zone, _strengthData, _reinforcementData] remoteExecCall ["SQFM_fnc_updateBattleHud"];

true;