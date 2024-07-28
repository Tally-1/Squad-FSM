params[
    ["_rad",nil,[0]]
];
private _pos = _self call ["getAvgPos"];
if(_self call ["inBattle"])exitWith{ 
    private _battle  = _self call ["getBattle"];
    private _buZones = _battle get "urbanZones";
    private _zones   = _buZones select {
        private _distance = (_x get "position") distance2D _pos;
        private _valid    = _distance <= _rad;
        _valid;
    };

    _zones;
};
private _buildings = [_pos, _rad] call SQFM_fnc_nearBuildings;
private _zones     = [_buildings, 30] call SQFM_fnc_getUrbanZones;

_zones;