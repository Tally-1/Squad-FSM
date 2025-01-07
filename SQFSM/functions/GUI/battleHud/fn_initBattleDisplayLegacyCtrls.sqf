params[
	["_display",nil,[displayNull]]
];
private _strengthPos  = [0.4, 0.08, 0.2, 0.03];
private _barTitle     = "Battle Presence";
private _strengthBar  = [_display, _strengthPos, _barTitle] call SQFM_fnc_BattleProgressBars;
private _dataArr      = [["strengthBar", _strengthBar]];
private _battleHud    = createHashMapObject [_dataArr];

_display setVariable ["SQFM_HUD",      _battleHud];
_display setVariable ["SQFM_barPos", _strengthPos];

_display;