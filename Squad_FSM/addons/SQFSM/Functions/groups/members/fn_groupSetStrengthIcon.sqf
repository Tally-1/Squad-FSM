private _coef  = _self call ["strengthCoef"];
private _prcnt = round(_coef*100);

private _color = "#86ff35";
if(_prcnt < 75)then{_color = "#ffe96f";};
if(_prcnt < 26)then{_color = "#ff4f4f";};

private _text    = [_prcnt,"%"]joinString"";
private _texture = [_text, 0.546, _color, "#00000000", "PuristaBold"]call SQFM_fnc_getTextTexture;

_self set ["strengthIndicator", _texture];

_prcnt;