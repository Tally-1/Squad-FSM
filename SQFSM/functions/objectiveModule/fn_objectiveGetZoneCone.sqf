private _zone = _self get"zone";
private _pos  = _zone#0;
private _rad  = _zone#1;
params[
    ["_startPos",  nil,    [[]]],
    ["_overLap",   30,      [0]],
    ["_coneWidth", 180,     [0]],  // degrees wide 
    ["_minDepth",  100,     [0]],
    ["_sort",      true, [true]]
];
private _dir         = _pos getDir _startPos;
private _coneDepth   = selectMax [_minDepth,_rad*0.5]; // How much is added to the original radius 
private _coneStart   = _rad-_overLap;
private _coneRad     = _coneStart+(_coneDepth);
private _maxPosCount = 150;
private _zoneCone    = [_pos, _coneRad, _dir, _coneWidth, _coneStart, 30,_maxPosCount] call SQFM_fnc_zoneCone;

if(_sort)
then{_zoneCone=[_zoneCone,[],{_startPos distance _x},"ASCEND"]call BIS_fnc_sortBy};

_zoneCone;