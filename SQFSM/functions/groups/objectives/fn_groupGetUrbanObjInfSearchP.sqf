params[
    ["_objective",nil,[objNull]]
];
private _objData         = _objective call getData;
private _startPos        = _self call ["getAvgPos"];
private _center          = _objData get "position";
private _dir             = _center getDir _startPos;
private _posCount        = 6;
private _midPositions    = _objData call ["getZoneMidPositions",[_dir, _posCount]];
private _urbanPositions  = _objData call ["getUrbanPositions"];
private _searchPositions = [];

if(_urbanPositions isEqualTo [])exitWith{[]};

{
    private _searchPos = [_x, _urbanPositions] call SQFM_fnc_getNearest;
    if(_searchPos in _searchPositions)then{_searchPos = _x};

    _searchPositions pushBackUnique _searchPos;
    
} forEach _midPositions;
private _finalSearchPos = [_center, _urbanPositions] call SQFM_fnc_getNearest;
private _pathPositions  = [_startPos, _searchPositions] call SQFM_fnc_posArrToPath;

_pathPositions pushBackUnique _finalSearchPos;


_pathPositions;