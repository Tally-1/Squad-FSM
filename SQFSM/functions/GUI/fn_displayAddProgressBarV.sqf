params[
	["_title",    nil,[""]],
	["_position", nil,[[]]],
	["_color",    nil,[[]]]
];
_position params[
	["_xPos",   nil,[0]],
	["_yPos",   nil,[0]],
	["_width",  nil,[0]],
	["_height", nil,[0]]
];
private _ratio     = _self get "ratio";
private _barPos    = [_xPos, _yPos,_width,_height];
private _titleSize = _width;
private _titlePos  = [_xPos, _yPos-(_titleSize*1.5), _titleSize,_titleSize/_ratio]; //[_xPos, _yPos,_width] call SQFM_fnc_formatPosCenterSquare;
private _top       = _yPos;
private _bottom    = _yPos+_height;

private _fill     = _self call ["addImage", ["\220th-jetPack\GUI_Components\paa\SquareFill.paa",_position,[0,1,0,0.5]]];
private _frame    = _self call ["addImage", ["\220th-jetPack\GUI_Components\paa\Square_edge.paa",_position, _color]];
private _titleImg = _self call ["addImage", ["",_titlePos]];

_titleImg call ["setText", [_title,0.53]];

private _dataArr = [ 
	["title", _titleImg],
	["frame",    _frame],
	["fill",      _fill],
	["top",        _top],
	["bottom",  _bottom],
	["size",    _height],
	["progress",      1],

	["hide",                   SQFM_fnc_hideProgressBar],
	["show",                   SQFM_fnc_showProgressBar],
	["setProgress",           SQFM_fnc_setProgressOnBar],
	["setTitle",           SQFM_fnc_setProgressBarTitle],
	["setFillColor",   SQFM_fnc_setProgressBarFillColor],
	["setFrameColor", SQFM_fnc_setProgressBarFrameColor],
	["setTitleColor", SQFM_fnc_setProgressBarTitleColor]
];

private _bar = createHashmapObject [_dataArr];

_bar;