private _taskData  = _self call ["getTaskData"];
private _validTask = (!isNil "_taskData")&&{str _taskData isNotEqualTo "[]"};
if!(_validTask)exitWith{};

private _code = str (_taskData get "update");
if(_code isEqualTo "{}")exitWith{};


_taskData call ["update"];

true;