private _defaultProxy = _this#0;
params[
	["_pos",      nil,                   [[]]],
	["_proxyPos", _defaultProxy, [[],objNull]],
	["_radius",     30,                   [0]]
];
private _parkingArea  = [_pos, _radius, _radius];
private _parkingSpots = [_parkingArea, 4, true, _proxyPos] call SQFM_fnc_clearPosInArea;
private _spotCount    = count _parkingSpots;

if(_spotCount isEqualTo 0)            exitWith{_pos};
if(_spotCount isEqualTo 1)            exitWith{_parkingSpots#0};
if(_proxyPos  isEqualTo _defaultProxy)exitWith{_parkingSpots#(_spotCount-1)};

private _parkingSpot = [_proxyPos, _parkingSpots] call SQFM_fnc_getNearest;

_parkingSpot;