params[
	["_pos", nil, [[]]]
];
private _parkingArea  = [_pos, 30, 30];
private _parkingSpot  = _pos;
private _parkingSpots = [_parkingArea, 4] call SQFM_fnc_clearPosInArea;
private _spotCount    = count _parkingSpots;

if(_spotCount > 0)then{
  _parkingSpot = _parkingSpots#(_spotCount-1);
};

_parkingSpot;