private _targetPos = (_this#0)#0;
params[
  ["_area",           nil,                 [[]]],
  ["_minRoadCount",    2,                   [0]],
  ["_proxyPos",       _targetPos, [[], objNull]], // The road nearest to this position will be used. Default is center of area.
  ["_allowExpansion", true,              [true]]  
];
private ["_parkingPos"];
private _roadPos = getPosATLVisual (([_area, _minRoadCount, _proxyPos, _allowExpansion] call SQFM_fnc_roadsInArea)#0);

if(isNil "_roadPos")
then{_roadPos = _targetPos;};

if(_proxyPos isEqualTo _targetPos)
then{_parkingPos = [_roadPos] call SQFM_fnc_findParkingSpot}
else{_parkingPos = [_roadPos, _proxyPos] call SQFM_fnc_findParkingSpot};

_parkingPos;