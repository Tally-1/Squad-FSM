private _coef     = _self call ["strengthCoef"];
private _prcnt    = round(_coef*100);
private _excluded = (_self get "grp") getVariable ["SQFM_Excluded", false];
private _color    = "#86ff35";
private _textSize = 0.57+(random 0.01);

if(_prcnt < 75)then{_color = "#ffe96f";};
if(_prcnt < 26)then{_color = "#ff4f4f";};

private _text    = [_prcnt,"%"]joinString"";
private _texture = [_text, _textSize, _color, "#00000000", "PuristaBold"]call SQFM_fnc_getTextTexture;

if(_excluded)then{
	_texture = ["excluded", 0.34, "#ff1d1d", "#00000000", "PuristaBold"]call SQFM_fnc_getTextTexture;
};

_self set ["strengthIndicator", _texture];

_prcnt;