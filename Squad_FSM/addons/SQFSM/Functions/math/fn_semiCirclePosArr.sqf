params [
    ["_zone",         nil,  [[]]], // [pos, rad] (The zone which will be encircled)
    ["_dir",          nil,   [0]], // 0-359 
    ["_dirRange",     nil,   [0]], // 0-360 (default to 180 degrees for a semicircle)
    ["_posToPosDist", nil,   [0]]  // 0-inf (the wanted distance between each position)
];
_zone params ["_center", "_radius"];

private _dir           = [_dir - (_dirRange*0.5)]call SQFM_fnc_formatDir;
private _circumference = _radius * 2 * 3.14159265358979323846; // Full circle circumference
private _angleStep     = _posToPosDist / _circumference * 360; // Angle step in degrees
private _positions     = [];

for "_i" from 0 to _dirRange step _angleStep do {
    private _currentDir = [_dir + _i]call SQFM_fnc_formatDir;
    private _pos = [_center, _currentDir, _radius] call SQFM_fnc_sinCosPos;
    _positions pushBack _pos;
};

_positions;