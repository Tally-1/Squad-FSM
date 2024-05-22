private ["_prcnt"];
private _initial = _self get "initialStrength";
private _current = _self call ["getStrength"];

if(_initial isEqualTo 0
or{_current isEqualTo 0})
then{_prcnt = 0}
else{_prcnt = round((_current / _initial)*100)};
private _color = "#86ff35";
if(_prcnt < 75)then{_color = "#ffe96f";};
if(_prcnt < 26)then{_color = "#ff4f4f";};

private _text    = [_prcnt,"%"]joinString"";
private _texture = [_text, 0.546, _color, "#00000000", "PuristaBold"]call SQFM_fnc_getTextTexture;

_self set ["strengthIndicator", _texture];

_prcnt;