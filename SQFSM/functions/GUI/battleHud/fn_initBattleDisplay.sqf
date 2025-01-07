private _display = ["SQFM_BattleHUD"] call SQFM_fnc_initHudDisplay;
private _data    = [_display, "SQFM_BattleHUD"] call SQFM_fnc_initDisplayData;

[_display] call SQFM_fnc_initBattleDisplayLegacyCtrls;

_display;