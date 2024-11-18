private _displayName = "SQFM_reinforcementInfo";
// private _display = uiNameSpace getVariable [_displayName,displayNull];
// if(!isNull _display)exitWith{_display};

private _display = [_displayName,true,true] call SQFM_fnc_initHudDisplay;
private _data    = [_display, _displayName] call SQFM_fnc_initDisplayData;
private _textPos = [0.09,0.045,0.25,0.08];
private _textBox = _data call ["addTextBox", [_textPos]];
private _color   = [0,0,0,0.1];

_data set ["getText", SQFM_fnc_getReforceInfoText];
_data set ["textBox",                    _textBox];

_display;