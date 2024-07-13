private _taskData = _self get"taskData";
private _taskCode = _taskData get"arrivalCode";

if((!isNil "_taskCode")
&&{_taskCode isNotEqualTo {}})
exitWith{_taskData call ["arrivalCode"]};

_self call ["deleteWaypoints"];

_self deleteAt "travelData";
_self set ["action", ""];
_self set ["state",  ""];
