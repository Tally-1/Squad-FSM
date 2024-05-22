params[
    ["_posArr",  nil, [[]]], // List of positions to be evaluated
    ["_enemies", nil, [[]]]  // List of enemies (Units / vehicles that needs to be hidden from)
];
private _safePositions = _posArr select {[_x,false,7,10] call SQFM_fnc_clearPos};
if(_safePositions isEqualTo []) exitWith{[]};
if(_enemies isEqualTo [])       exitWith{_safePositions};

private _enemyClusters  = [_enemies] call SQFM_fnc_clustersFromObjArr;
private _enemyPositions = _enemyClusters apply {_x get "position"};
private _safePositions  = _posArr select {[_x, _enemyPositions, 2] call SQFM_fnc_posHasTerrainCover};

// Terrain is the best cover so if found only those are returned.
if(_safePositions isNotEqualTo [])exitWith{_safePositions};

_safePositions  = _posArr select {[_x, _enemyPositions, 3, _enemies] call SQFM_fnc_posIsHidden};

_safePositions;