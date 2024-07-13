params[
	["_module", nil, [objNull]]
];
(_module getVariable "objectarea")
params[
	["_a",           nil,    [0]],
	["_b",           nil,    [0]],
	["_angle",       nil,    [0]],
	["_isRectangle", nil, [true]],
	["_c",           nil,    [0]]
]; 

private _center = getPosATLVisual _module;
private _area   = [_center, _a, _b, _angle, _isRectangle, _c];

_area;