private _targetPos = (_this#0)#0;
params[
  ["_area",           nil,                 [[]]],
  ["_minRoadCount",    2,                   [0]],
  ["_proxyPos",       _targetPos, [[], objNull]],
  ["_allowExpansion", true,              [true]]  
];

private _radius = selectMax[_area#1, _area#2];
private _center    = _area#0;
private _roads     = _center nearRoads _radius;
private _roadCount = count _roads;

if(_allowExpansion)then{
    for "_i"from 1 to 10 do 
    {
        if(_roadCount >= _minRoadCount)exitWith{};
        
        _radius    = _radius+50;
        _roads     = _center nearRoads _radius;
        _roadCount = count _roads;
    };
};

_roads = [_roads, [], {_proxyPos distance _x}, "ASCEND"] call BIS_fnc_sortBy;

_roads;