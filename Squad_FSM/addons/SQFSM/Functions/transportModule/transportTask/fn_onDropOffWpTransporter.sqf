params[
	["_transportGroup", nil, [grpNull]]
];
private _grpData  = _transportGroup getVariable "SQFM_grpData";
private _taskData = _grpData get "taskData";
(_taskData get "params")params[
	["_passengerGrp",   nil,      [grpNull]],
	["_vehicle",        nil,      [objNull]]
];
private _psngrData  = _passengerGrp getVariable "SQFM_grpData";
private _timer      = time + round(count units _passengerGrp * 2);
private _squadCount = count units _passengerGrp;


(driver _vehicle)disableAI "path";
_vehicle setVelocityModelSpace [0,0,0];
_taskData set ["state", "Unloading"];
_psngrData call ["ejectAll"];

waitUntil { 
	private _outCount = count (units _passengerGrp select{vehicle _x isEqualTo _x});
	private _percent  = round((_outCount/_squadCount)*100);
	private _onFoot   = _psngrData call ["boardingStatus"] isEqualTo "on foot";
	private _timedOut = time > _timer;
	private _stateTxt = ["Unloading (",_percent,"%)"]joinString"";
	_taskData set ["state", _stateTxt];
	
	if((!isNil "_onFoot")&&{_onFoot})     exitWith{true;};
	if((!isNil "_timedOut")&&{_timedOut}) exitWith{true;};
	
	false;
};

private _onFoot = _psngrData call ["boardingStatus"] isEqualTo "on foot";
if!(_onFoot)then{_psngrData call ["ejectAll"]};

_taskData set ["state", "Returning to base"];
(driver _vehicle)enableAI "path";

_psngrData call ["onArrival"];

true;