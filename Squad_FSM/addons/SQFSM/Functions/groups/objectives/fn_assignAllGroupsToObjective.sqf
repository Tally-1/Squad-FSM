private _groups = call SQFM_fnc_getIdleGroups;
private _east   = [];
private _west   = [];
private _guer   = [];
{
    if(side _x isEqualTo east)        then{_east pushBack _x};
    if(side _x isEqualTo west)        then{_west pushBack _x};
    if(side _x isEqualTo independent) then{_guer pushBack _x};
    
} forEach _groups;

private _scr1 = [_east] spawn SQFM_fnc_assignGroupListToObectives;
private _scr2 = [_west] spawn SQFM_fnc_assignGroupListToObectives;
private _scr3 = [_guer] spawn SQFM_fnc_assignGroupListToObectives;

waitUntil {
    sleep 1;
    scriptDone  _scr1 &&
    {scriptDone _scr2 &&
    {scriptDone _scr3}}
};