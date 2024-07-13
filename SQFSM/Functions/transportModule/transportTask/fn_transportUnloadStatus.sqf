params[
	["_passengerGroup", nil,       [grpNull]],
	["_timer",          nil,             [0]],
    ["_taskData",       nil, [createHashMap]]
];
private _psngrData = _passengerGroup call getData;

if(isNil "_passengerGroup") exitWith{true};
if(isNil "_psngrData")      exitWith{true};

private _squadCount = count units _passengerGroup;
private _outCount   = count (units _passengerGroup select{vehicle _x isEqualTo _x});
private _percent    = round((_outCount/_squadCount)*100);
private _onFoot     = _psngrData call ["boardingStatus"] isEqualTo "on foot";
private _timedOut   = time > _timer;
private _stateTxt   = ["Unloading (",_percent,"%)"]joinString"";
_taskData set ["state", _stateTxt];

if((!isNil "_onFoot")&&{_onFoot})     exitWith{true;};
if((!isNil "_timedOut")&&{_timedOut}) exitWith{true;};

false;