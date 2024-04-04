params [
	["_man",    nil, [objNull]], 
	["_target", nil, [objNull]]
];
private _posA   = ([_man] call SQFM_fnc_cluster)    get "position";
private _posB   = ([_target] call SQFM_fnc_cluster) get "position";
private _radius = ceil((_posA distance2D _posB) / 1.8);
private _center = [_posA, _posB, true] call SQFM_fnc_getMidpoint;
_radius         = [_center, _radius] call SQFM_fnc_battlefieldRadius;

if(_radius < 150)then{_radius = 150;};

[_center, _radius];