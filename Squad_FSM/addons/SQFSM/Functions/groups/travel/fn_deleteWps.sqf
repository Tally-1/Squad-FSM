private _group    = _self get"grp";
private _count    = count waypoints _group - 1;
private _taskWps  = _self get "taskData" get "waypoints";
for"_i"from 0 to _count do{deleteWaypoint [_group, 0]};

if(!isNil "_taskWps")then{for"_i"from 0 to count _taskWps -1 do{_taskWps deleteAt 0}};


true;