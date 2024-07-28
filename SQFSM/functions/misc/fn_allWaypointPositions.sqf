private _positions = [];

{
    private _data  = _x call getData;
    private _hasWp = (!isNil "_data")&&{_data call ["activeWp"]};
    if(_hasWp)then{
        private _wp  = [_x, currentWaypoint _x];
        private _pos = [waypointPosition _wp] call SQFM_fnc_roundPos;
        _positions pushBackUnique _pos;
    };
    
} forEach allGroups;

_positions;