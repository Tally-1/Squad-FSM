params [
	["_pos",      nil, [[]]],
	["_radius",   nil,  [0]],
	["_posCount", 32,   [0]],
	["_z",        0,    [0]],
	["_dir",      0,    [0]]
];
private _positions = [];
private _dirIncrement = (360 / _posCount);

for "_i" from 0 to (_posCount -1)
do {
        private _newPos = [_pos, _dir, _radius, _z] call SQFM_fnc_sinCosPos;
        _positions pushBack _newPos;
        _dir = _dir + _dirIncrement;
   };

_positions;