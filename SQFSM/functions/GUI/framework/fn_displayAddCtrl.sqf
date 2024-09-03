params[
	["_type",   nil,          [""]],
	["_pos",    nil,          [[]]],
	["_show",   true,      [false]]
];
private _display        = _self get "display";
private _ctrl           = _display ctrlCreate [_type, -1];
private _imgCtrl        = (toLower _type) isEqualTo "rscpicture";
private _structuredText = (toLower _type) isEqualTo "rscstructuredtext";
private _textAction     = "setText";
private _colorAction    = "setTextColor";
private _setTextCode    = SQFM_fnc_setCtrlStandardText;
private _ratio          = (getResolution#1)/(getResolution#0);
private _hidden         = _show isEqualTo false;
private _typeName       = _type;

if(_structuredText)then{ 
	_typeName = "structuredText";
	_setTextCode = SQFM_fnc_setCtrlStructuredText;
};

if(_imgCtrl)then{
	_typeName    = "image";
	_textAction  = "setImage";
	_colorAction = "setColor";
};

private _dataArr = [
	["ctrl",                                                           _ctrl],
	["type",                                                       _typeName],
	["hidden",                                                       _hidden],
	["ratio",                                                         _ratio],
    ["font",                                                              ""],

//                                   {METHODS}
	["hide",                                               SQFM_fnc_hideCtrl],
	["show",                                               SQFM_fnc_showCtrl],
	["setPosGrid",                                    SQFM_fnc_oopCtrlSetPos],
	["setPos",                                    SQFM_fnc_oopCtrlSetPosSafe],
	["setPosSqr",                           SQFM_fnc_oopCtrlSetPosSafeSquare],
	// ["setPosC",                             SQFM_fnc_oopCtrlSetPosSafeCenter],
    ["setFont",                                  SQFM_fnc_displayCtrlSetFont],
	["getPos",                                    SQFM_fnc_oopCtrlGetPosSafe],
	[_textAction,                                               _setTextCode],
    ["spawnStringText",                      SQFM_fnc_displayCtrlSpawnString],
	[_colorAction,  {params["_clr"];(_self get "ctrl")ctrlSetTextColor _clr}]
];
private _data = createHashmapObject [_dataArr];

_data call ["setPos", [_pos]];

_ctrl setVariable ["data", _data];

(_self get "controls") pushBackUnique _ctrl;

_ctrl ctrlShow _show;
_ctrl setVariable ["SQFM_data", _data];

_data;