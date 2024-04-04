params[
	["_center",      nil,   [[]]],
	["_a",           nil,    [0]],
	["_b",           nil,    [0]],
	["_angle",       nil,    [0]],
	["_isRectangle", nil, [true]],
	["_c",           nil,    [0]]
];

_center             = ATLToASL _center;
private _z          = _center#2;
private _cFront     = [_center, _angle,       _b, _z] call SQFM_fnc_sinCosPos;
private _frontRight = [_cFront, _angle+90,    _a, _z] call SQFM_fnc_sinCosPos;
private _frontLeft  = [_cFront, _angle-90,    _a, _z] call SQFM_fnc_sinCosPos;
private _cBack      = [_center, (_angle+180), _b, _z] call SQFM_fnc_sinCosPos;
private _backRight  = [_cBack, _angle+90,     _a, _z] call SQFM_fnc_sinCosPos;
private _backLeft   = [_cBack, _angle-90,     _a, _z] call SQFM_fnc_sinCosPos;

private _positions      = [];
private _floorPositions = [_frontRight, _frontLeft, _backLeft, _backRight] apply {ASLToATL _x};
private _roofPositions  = _floorPositions apply {[_x, _c] call SQFM_fnc_AddZ;};

_positions append _floorPositions;
_positions append _roofPositions;

_floorPositions =
_floorPositions apply {
	_x params ["_xx", "_y", "_z"];
	[_xx, _y, 0.2];
};

[_floorPositions, _roofPositions, _positions];