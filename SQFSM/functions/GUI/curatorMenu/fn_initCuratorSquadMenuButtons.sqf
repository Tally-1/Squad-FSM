private _img     = "#(argb,8,8,3)color(1,1,1,0.800000,ca)";
private _yPos    = 0.71;
private _width   = 0.06;
private _height  = 0.025;
private _pos     = [0.333,_yPos, _width,_height];
private _close   = { ctrlParent (_this#0) closeDisplay 1};
private _apply   = SQFM_fnc_applySquadMenuSettings;

private _buttonC = _self call ["addButton",[_pos, "CANCEL", _close]];
_buttonC call ["setFont",["PuristaLight"]];

_pos set [0,0.606];

private _buttonA = _self call ["addButton",[_pos, "APPLY", _apply]];
_buttonA call ["setFont",["PuristaLight"]];

_self set ["cancelButton", _buttonC];
_self set ["applyButton",  _buttonA];

true;