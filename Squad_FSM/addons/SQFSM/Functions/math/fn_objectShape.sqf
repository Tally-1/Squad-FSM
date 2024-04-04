params [
	["_object",nil,[objNull]]
];
(boundingBox _object)#1
params[
	"_width",
	"_length",
	"_height"
];

private _X_Y_Ratio	= _length / _width;
private _maxSize    = selectMax [_width, _length, _height];
private _center		= boundingCenter _object;
private _area       = [getPosASLVisual _object, _width, _length, getDirVisual _object, true, _height];
private _dataArr    = [
	["width",	[_width,   1]  call SQFM_fnc_decimals],
	["length", 	[_length,  1]  call SQFM_fnc_decimals],
	["height", 	[_height,  1]  call SQFM_fnc_decimals],
	["maxSize", [_maxSize, 1]  call SQFM_fnc_decimals],
	["center", 	                              _center],
	["area",                                    _area],
	["Y to X", 	[_X_Y_Ratio, 1]call SQFM_fnc_decimals],
	["canFit",                SQFM_fnc_shapeFitsShape]
];

private _shape = createHashmapObject[_dataArr];

_shape;