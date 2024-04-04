params[
	["_origin", nil, [[]]],
	["_dir",    nil,  [0]],
	["_dist",   nil,  [0]],
	["_z",      0,    [0]]
];
private _pos = _origin getPos [_dist, _dir];

[_pos#0, _pos#1, _z];