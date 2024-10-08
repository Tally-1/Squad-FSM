params [
    ["_position",nil, [[]]],
    ["_radius",  2000, [0]]
];

private _locationName = "unknown";
private _locationPos  = [0,0,0];
private _urbans       = [];
private _allLocationTypes = [
    ["NameCityCapital"],
    ["NameCity"],
    ["NameVillage"]
];


{
    private _namePos = [_position, _radius, _x] call SQFM_fnc_getLocationNamePos;
    private _name    = _namePos#0;
    if(_name isNotEqualTo "")
    then{_urbans pushBackUnique _namePos};

}forEach _allLocationTypes;

if(_urbans isNotEqualTo [])exitWith{
    private _sorted         = [_urbans, [], {_position distance2D (_x#1)}, "ASCEND"] call BIS_fnc_sortBy;
    private _nearLocNamePos = _sorted#0;
    _nearLocNamePos;
};


_allLocationTypes = [
    ["NameMarine"],
    ["NameLocal"]
];

{
    private _namePos = [_position, _radius, _x] call SQFM_fnc_getLocationNamePos;
    private _name    = _namePos # 0;
    if!(_name isEqualTo "")
    exitWith{
                _locationName = _name;
                _locationPos  = _namePos # 1;
            };
}forEach _allLocationTypes;


[_locationName, _locationPos];