params [
    ["_ignoreFipo",      false,    [true]],
    ["_ignorePath",      false,    [true]],
    ["_ignoreVehicle",   false,    [true]],
    ["_includeExcluded", false,    [true]]
];
private _functionalMen = [];

{
    private _functional = [_x, _ignoreFipo, _ignorePath, _ignoreVehicle, _includeExcluded] call SQFM_fnc_functionalMan;
    private _onFoot     = vehicle _x isEqualTo _x;
    if(_functional
    &&{_onFoot})
    then{_functionalMen pushBack _x};

} forEach units (_self get "grp");

_functionalMen;