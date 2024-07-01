private _reinforGrps = _self get "activeReinforcements";
private _zone        = _self get "zone";
private _reforData   = [_zone, _reinforGrps] call SQFM_fnc_zoneStrengthBySide;
_self set  ["reinforData", _reforData];

_reforData;