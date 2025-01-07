private _group     = _self get "group";
private _grpData   = _group call getData;
private _grpPos    = _grpData call ["getAvgPos"];
private _battle    = _self get "battle";
private _safeDir   = _self call ["safeDirection"];
private _safeZones = (_battle get "urbanZones")select{
        private _position     = _x get "position";
        private _currentDir   = _grpPos getDir _position;
        private _maxDeviation = 90;
        private _inSafeDir    = [_currentDir, _safeDir, _maxDeviation] call SQFM_fnc_inDirRange;
        
        _inSafeDir;
};

_safeZones = [_safeZones, [], {_grpPos distance (_x get "position")}, "ASCEND"] call BIS_fnc_sortBy;

_safeZones;