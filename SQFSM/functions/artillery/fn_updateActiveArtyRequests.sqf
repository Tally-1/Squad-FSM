private _toDelete = [];

{
    private _missionId = _x;
    private _timeLimit = _y#3;
    if(time > _timeLimit)
    then{_toDelete pushBack _missionId};
    
} forEach SQFM_activeArtyRequests;


{
    SQFM_activeArtyRequests deleteAt _x;
    
} forEach _toDelete;


true;