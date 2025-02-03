#include "..\misc\textIncludes.sqf";
private _displayName = "SQFM_mapInfo";
private _display     = [_displayName,true,true] call SQFM_fnc_initHudDisplay;
private _data        = [_display, _displayName] call SQFM_fnc_initDisplayData;
private _titleColor  = [0.4,1,0.9,0.7];
private _textPos     = [0.35,0.05,0.3,0.12];
private _textBox     = _data call ["addTextBox", [_textPos]];
private _text        = [
    _center,_bigTxt,"Select Target",_end,
    _newLine,_newLine,"Click where you request the artillery to fire.",
    _newLine,"[ESC] to cancel"
]joinString"";

_textBox call ["setText",[_text]];

true;