params [
	["_start",       nil],
	["_end",         nil],
	["_posCount",    10],
	["_includeEnds", true],
	["_zValue",      nil]
];

private _positions = [];
private _dir = _start getDir _end;
private _dist = _start distance2D _end;
private _iterationDist = _dist / _posCount;
private _distToNextPos = _iterationDist;

for "_i" from 1 to _posCount do 
{
    private _newPos = [_start, _dir, _distToNextPos] call SQFM_fnc_sinCosPos;

    if!(isNil "_zValue")then{_newPos = [_newPos#0, _newPos#1, _zValue]};

    _positions pushBack _newPos;
    _distToNextPos = _distToNextPos + _iterationDist;
};

if!(_includeEnds)exitWith{_positions;};

private _returnArr = [_start];
_returnArr append _positions;
_returnArr pushBack _end;

_returnArr;