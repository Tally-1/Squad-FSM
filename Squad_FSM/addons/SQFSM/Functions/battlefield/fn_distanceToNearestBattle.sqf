params[
    ["_pos",nil,[[]]]
];
private _battlePosRad = ([_pos] call SQFM_fnc_nearestBattlePosRad);
if(isNil "_battlePos")exitWith{worldSize;};
private _battlePos = _battlePosRad#0;
private _battleRad = _battlePosRad#1;
private _distance  = (_pos distance2D _battlePos)-(_battleRad*0.8);

_distance;