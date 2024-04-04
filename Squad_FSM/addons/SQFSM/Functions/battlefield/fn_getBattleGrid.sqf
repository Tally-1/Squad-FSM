params[ 
	["_pos", nil, [[]]],
	["_rad", nil,  [0]]
];
private _gridCount  = ceil (_rad / 10);
if(_gridCount < 100)then{_gridCount = 100;};
private _gridPositions = [_pos, _rad, _gridCount] call SQFM_fnc_squareGrid;
private _posDist       = _gridPositions#0 distance2D (_gridPositions#1);

while {_posDist > 30} do {
		_gridCount     = _gridCount+50;
		_gridPositions = [_pos, _rad, _gridCount] call SQFM_fnc_squareGrid;
		_posDist       = _gridPositions#0 distance2D (_gridPositions#1);
};

_gridPositions;