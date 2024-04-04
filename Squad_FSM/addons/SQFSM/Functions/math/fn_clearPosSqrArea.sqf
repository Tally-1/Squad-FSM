params[
	["_center",    nil,     [[]]],
	["_size",      nil,      [0]],
	["_maxSpread", 20,       [0]]
];

if(_size < 30)then{_size = 30;};
private _posRad    = 10;
private _posCount  = round (_size / _posRad);

if(_posCount < 30)then{_posCount = 30;};

private _positions  = [_center, _size, _posCount, 0, false] call SQFM_fnc_squareGrid;
private _posDist    = _positions#0 distance2D (_positions#1);
private _attempts   = 0;

while {_posDist > _maxSpread && {_attempts < 5}} do { 
		_posCount  = _posCount+50;
		_positions = [_center, _size, _posCount] call SQFM_fnc_squareGrid;
		_posDist   = _positions#0 distance2D (_positions#1);
		_attempts=_attempts+1;
};


private _posFilter = {
	_x isNotEqualTo [0,0,0] 
	&& {_x isNotEqualTo [0,0]
	&& {[_x, true, 5] call SQFM_fnc_clearPos
	}}
};

_positions = _positions select _posFilter;

_positions;