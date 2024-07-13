params[
	["_objModule",nil,[objNull]]
];
private _dirRange    = 140;
private _minRad      = 300;
private _minBuffer   = 100;
private _posDist     = 50;
private _objData     = _objModule call getData;
private _grpPos      = _self call ["getAvgPos"];
private _side        = _self get "side";
private _zone        = _objData get "zone";
private _radius      = _zone#1;
private _finalMinRad = _minRad+_minBuffer;
private _buffer      = _finalMinRad - _radius;
private _prevSafePos = _objData call ["getStoredSafePositions",[_side, _grpPos]];

if(!isNil "_prevSafePos")exitWith{ 
    private _safePos   = selectRandom _prevSafePos;
    private _insertPos = [_safePos, _grpPos, _posDist] call SQFM_fnc_findParkingSpot;
    
    _insertPos;
};

if(_buffer < _minBuffer)then{_buffer = _minBuffer;};

private _safePositions = 
[
    _grpPos,
    _zone,
    _side,
    _buffer,
    _dirRange,
    _posDist
] call SQFM_fnc_dangerZoneSafePositions;

private _safePos   = selectRandom _safePositions;
private _insertPos = [_safePos, _grpPos, _posDist] call SQFM_fnc_findParkingSpot;

if(count _safePositions > 4)
then{_objData call ["storeSafePosSearch",[time, _side, _grpPos, _safePositions]]};

// SQFM_Custom3Dpositions pushBack [_insertPos, "I", [1,0,0,1]];

_insertPos;