private _groups       = _self get "groups";
private _zone         = _self get "zone";
private _strengthData = [_zone, _groups] call SQFM_fnc_zoneStrengthBySide;
_self set  ["strengthData", _strengthData];

_strengthData;