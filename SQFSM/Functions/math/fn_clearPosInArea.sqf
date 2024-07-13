private _targetPos = (_this#0)#0;
params[
  ["_area",           nil,                [[]]],
  ["_minPosCount",    1,                   [0]],
  ["_allowExpansion", true,             [true]],
  ["_proxyPos",       _targetPos, [[],objNull]]
];

private _areaSize = selectMax[_area#1, _area#2];
private _center   = _area#0;
private _posgrid  = [_center, _areaSize] call SQFM_fnc_clearPosSqrArea;
private _posCount = count _posgrid;
private _attempts = 0;

while{_posCount<_minPosCount
&&   {_attempts < 3}}do{
    _areaSize = _areaSize+50;
    _attempts = _attempts+1;
    
    _posgrid  = [_center, _areaSize] call SQFM_fnc_clearPosSqrArea;
    _posCount = count _posgrid;
};

_posgrid = [_posgrid, [], {_center distance _proxyPos}, "ASCEND"] call BIS_fnc_sortBy;

_posgrid;