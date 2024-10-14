private _displayName = "SQFM_debugHUD";
private _display     = [_displayName,true,true] call SQFM_fnc_initHudDisplay;
private _data        = [_display, _displayName] call SQFM_fnc_initDisplayData;
private _title       = ["Squad FSM ", SQFSM_Version," (Debug-Mode)"]joinString"";
private _titleColor  = if(SQFM_baseModset)then{[0.4,1,0.9,0.7]}else{[0.99,0.46,0,0.7]};
private _textPos     = [0.01,0.9,0.25,0.09];
private _textBox     = _data call ["addTextBox", [_textPos]];_textPos set[1,0.89];_textPos set[3,0.1];
private _frame       = _data call ["addFrame",[_textPos, _title, _titleColor, false, 0.04]];

_data set  ["textBox", _textBox];
_data set  ["update",  SQFM_fnc_updateDebugHudOOP];
_data call ["update"];

true;