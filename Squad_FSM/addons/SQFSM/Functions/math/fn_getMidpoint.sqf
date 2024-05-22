params [
	["_posA",  nil, [[],objNull]],
	["_posB",  nil, [[],objNull]],
	["_round", false, [false]]
]; 
if(typeName _posA isEqualTo "OBJECT")then{_posA = getPosATLVisual _posA};
if(typeName _posB isEqualTo "OBJECT")then{_posB = getPosATLVisual _posB};

private _dir      = _posA getDir _posB;
private _distance = (_posA distance2D _posB) / 2;
private _midpos   = [_posA, _dir, _distance] call SQFM_fnc_sinCosPos;

if(_round)exitWith{[_midpos] call SQFM_fnc_roundPos;};

_midpos;