params[
    ["_roadArr",nil,[[]]]
];
private _validTypes   = ["ROAD", "MAIN ROAD", "TRACK", "TRAIL"];
private _roadHashmaps = [];

{
    private _hashmap   = [_x] call SQFM_fnc_getRoadData;
    private _validType = (_hashmap get "type") in _validTypes;
    private _canDrive  = (_hashmap get "pedestrian") isEqualTo false;
    private _valid     = _validType && {_canDrive};
    if(_valid)
    then{_roadHashmaps pushBack _hashmap};

} forEach _roadArr;

_roadHashmaps;