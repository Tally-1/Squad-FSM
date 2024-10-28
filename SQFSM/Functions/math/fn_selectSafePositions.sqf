params[
    ["_posArr",  nil,     [[]]], // List of positions to be evaluated
    ["_enemies", nil,     [[]]], // List of enemies (Units / vehicles that needs to be hidden from)
    ["_forceAll",false, [true]]
];
private _safePositions = _posArr select {[_x,false,7,10] call SQFM_fnc_clearPos};
if(_safePositions isEqualTo []) exitWith{[]};
if(_enemies isEqualTo [])       exitWith{_safePositions};

private _enemyClusters  = [_enemies] call SQFM_fnc_clustersFromObjArr;
private _enemyPositions = [];

{
    private _pos = _x get "position";
    if(!isNil "_pos")
    then{_enemyPositions pushBackUnique _pos};
    
} forEach _enemyClusters;

if(_forceAll isEqualTo false)
exitWith{_safePositions select {[_x, _enemyPositions, 3, _enemies] call SQFM_fnc_posIsHidden}};

private _safePositions  = _safePositions select {[_x, _enemyPositions, 2] call SQFM_fnc_posHasTerrainCover};

// Terrain is the best cover so if found only those are returned.
if(_safePositions isNotEqualTo [])
exitWith{_safePositions};

private _newSafePositions  = _safePositions select {[_x, _enemyPositions, 3, _enemies] call SQFM_fnc_posIsHidden};

_safePositions insert [count _safePositions-1,_newSafePositions,true];

_safePositions;