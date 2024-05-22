params [
	["_man",    nil, [objNull]], 
	["_target", nil, [objNull]]
];
private _baseRad = ceil(_man distance2D _target);
private _center  = [_man, _target] call SQFM_fnc_battlefieldCenter;
private _radius  = [_center, _baseRad] call SQFM_fnc_battlefieldRadius;

[_center, _radius];