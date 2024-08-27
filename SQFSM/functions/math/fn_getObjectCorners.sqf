params[
    ["_object", nil, [objNull]]
];
(0 boundingBoxReal _object)#0
params[
	"_width",
	"_length",
	"_height"
];
private _area = [getPosASLVisual _object, _width, _length, getDirVisual _object, true, _height];
private _corners = (_area call SQFM_fnc_getAreaCorners)#0;
_corners
params[
    ["_frontRight", nil, [[]]], 
    ["_frontLeft",  nil, [[]]], 
    ["_backLeft",   nil, [[]]], 
    ["_backRight",  nil, [[]]]
];

[_frontRight, _frontLeft, _backLeft, _backRight];