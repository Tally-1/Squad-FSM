params[
	["_display",nil,[displayNull]],
	["_varName",nil,         [""]]
];
private _ratio   = (getResolution#1)/(getResolution#0);
private _dataArr = [ 
	["display",                  _display],
	["hidden",                      false],
	["name",                     _varName],
	["ratio",                      _ratio],
	["controls",                       []],

	/*************{METHODS}*************/
	["hideDisplay",               SQFM_fnc_hideDisplay],
	["showDisplay",               SQFM_fnc_showDisplay],
	["addCtrl",                SQFM_fnc_displayAddCtrl],
	["addImage",          SQFM_fnc_displayAddImageCtrl],
	["addProgressBar", SQFM_fnc_displayAddProgressBarV],
	["addTextBox",          SQFM_fnc_displayAddTextBox],
    ["addButton",            SQFM_fnc_displayAddButton],
    ["addFrame",              SQFM_fnc_displayAddFrame],
    ["addCheckBox",        SQFM_fnc_displayAddCheckBox],
    ["addSlider",            SQFM_fnc_displayAddSlider]
];

private _data = createHashmapObject [_dataArr];

_display setVariable ["SQFM_data", _data];

_data;