private _display = _self get "display";
private _barPos  = _display getVariable "SQFM_barPos";
private _statPos = [_barPos#0, (_barPos#1)+(_barPos#3), _barPos#2, (_barPos#3)*2];
private _statTxt = _data call ["addTextBox",[_statPos, "100%"]];

_statTxt set ["setValues", SQFM_fnc_setBattleHudStatTextValues];
_statTxt set ["update",    SQFM_fnc_updateBattleHudStatText];

_statTxt;