params[
    ["_vehicle",    nil,[objNull]],
    ["_lethalOnly", nil,   [true]]
];
private _artyAmmo  = getArtilleryAmmo [_vehicle];
private _magAmmo   = magazinesAmmo _vehicle select {_x#0 in _artyAmmo};
private _magazines = [];
private _ammoCount = createHashmapObject[[]];

// Choose highest count first.
_magAmmo = [_magAmmo, [], {_x#1}, "DESCEND"] call BIS_fnc_sortBy;

{
    
    _x params["_name","_count"];
    private _magData      = _x call SQFM_fnc_magazineData;
    private _currentCount = _ammoCount getOrDefault [_name, 0];
    private _newCount     = _currentCount + _count;
    private _lethal       = _magData get "artyHE";
    private _include      = _lethal || {!_lethalOnly};
    
    if(_include)then{
        _magazines pushBack _magData;
        _ammoCount set [_name, _newCount];
    };

} forEach _magAmmo;

[_ammoCount, _magazines];