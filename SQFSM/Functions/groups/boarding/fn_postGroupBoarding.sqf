private _status = _self call ["boardingStatus"];
if(_status isEqualTo "boarded")
exitWith{_self call ["endBoarding", [true]]};

if(!canSuspend)
then{["Group boarding called in unscheduled environment", "hint"] call dbgm;};

private _timer = time + 10;
waitUntil{sleep 0.1; _self call ["boardingStarted", [_timer]]};

private _failed = _self call ["boardingFailed"];
if(_failed) exitWith{_self call ["endBoarding",  [false]]};

private _boardingMen = _self call ["getBoardingMen"];
private _vehicles    = [_boardingMen] call SQFM_fnc_getAssignedVehicles;
private _startPos    = [_boardingMen] call SQFM_fnc_avgPos2D;
private _endPos      = [_vehicles]    call SQFM_fnc_avgPos2D;
private _distance    = round (_startPos distance2D _endPos);
private _timeLimit   = (round (_distance/3))+count _boardingMen;

if(isNil "_timeLimit") then{_timeLimit = 30; "nil boarding timer" call dbgm;};
if(_timeLimit < 30)    then{_timeLimit = 30;};
private _timer = time + _timeLimit;
waitUntil {sleep 0.1; _self call ["boardingEnded", [_timer]]};

_status = _self call ["boardingStatus"];
if(_status isEqualTo "boarded")
exitWith{_self call ["endBoarding", [true]]};

{[_x] call SQFM_fnc_teleportIntoAssignedVehicle} forEach (_self call ["getBoardingMen"]);

_status = _self call ["boardingStatus"];
if(_status isEqualTo "boarded")
exitWith{_self call ["endBoarding", [true]]};

_self call ["endBoarding", [false]];