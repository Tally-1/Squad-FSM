private _pos         = _self get "cluster"get"position";
private _rad         = 400;
private _defaultZone = [_pos, _rad];
private _battlefield = _self call ["getBattle"];

if(isNil "_battlefield")exitWith{_defaultZone};
private _battleZone = [
    _battlefield get "position",
    _battlefield get "radius"
];

_battleZone;