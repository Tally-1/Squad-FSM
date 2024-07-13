Params [
	["_currentDir",   nil, [0]],
	["_targetDir",    nil, [0]],
	["_maxDeviation", 3,   [0]]
];
private _formattedDirs  = [_currentDir, _targetDir, _maxDeviation] call SQFM_fnc_formatDirRanges;

_currentDir = _formattedDirs#0;
_targetDir  = _formattedDirs#1;

private _inDirRange = false;
private _DirLow     = [(_targetDir - _maxDeviation), false] call SQFM_fnc_formatDir;
private _DirHigh    = [(_targetDir + _maxDeviation), false] call SQFM_fnc_formatDir;
private _inRange    = ((_CurrentDir > _DirLow) && {_CurrentDir < _DirHigh});
private _equal      = _CurrentDir isEqualTo _targetDir;

if(_inRange || _equal)
then{_inDirRange = true};

_inDirRange;