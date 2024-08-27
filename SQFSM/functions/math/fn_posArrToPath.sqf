params[
    ["_startPos", nil,[[]]],
	["_posArr",   nil,[[]]]
];
private _curPos          = _startPos;
private _sortedPositions = [];
private _posCount        = count _posArr;

for "_i"from 1 to _posCount do { 
    private _nextPos = [_curPos, _posArr] call SQFM_fnc_getNearest;
    _sortedPositions pushBackUnique _nextPos;
    _curPos = _nextPos;
    _posArr = _posArr select {!(_x in _sortedPositions)};
};

_sortedPositions;