params[
	["_grpA", nil, [grpNull]],
	["_grpB", nil, [grpNull]]
];
private _posA   = _grpA getVariable "SQFM_grpData" call ["getAvgPos"];
private _posB   = _grpB getVariable "SQFM_grpData" call ["getAvgPos"];
private _midPos = [_posA, _posB, true] call SQFM_fnc_getMidPoint;
private _radius = (_posA distance2D _posB)*0.5;

[_midPos, _radius];