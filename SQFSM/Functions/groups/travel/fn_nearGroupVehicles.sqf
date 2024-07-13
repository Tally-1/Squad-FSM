params[
	["_distance", nil, [0]]
];
private _groupPos     = _self get"groupCluster"get"position";
private _nearVehicles = [_groupPos] call SQFM_fnc_getNearAvailVehicles;

_nearVehicles;