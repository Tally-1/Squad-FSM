private _targetPos = (_this#0)#0;
params[
  ["_area",           nil,                 [[]]],
  ["_minRoadCount",    2,                   [0]],
  ["_proxyPos",       _targetPos, [[], objNull]], // The road nearest to this position will be used. Default is center of area.
  ["_allowExpansion", true,              [true]]  
];
private _roadPos    = getPosATLVisual (([_area, _minRoadCount, _proxyPos, _allowExpansion] call SQFM_fnc_roadsInArea)#0);
private _parkingPos = [_roadPos] call SQFM_fnc_findParkingSpot;

_parkingPos;