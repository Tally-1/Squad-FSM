params[
	["_men",      nil,      [[]]],
	["_vehicle",  nil, [objNull]]
];
private _clusterDataRaw = [_men] call SQFM_fnc_objArrData;
private _position       = _clusterDataRaw#0;
private _radius         = _clusterDataRaw#1;
private _distance       = _position distance2D _vehicle;
// private _hasCapacity    = count _men < 

if(_distance < SQFM_boardTeleportDist
&&{_radius   < 100})
exitWith{true;};

false;