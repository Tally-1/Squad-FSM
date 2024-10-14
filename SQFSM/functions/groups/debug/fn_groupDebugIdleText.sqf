private _available       = _self call ["setLastActionTime"];
private _timeSinceAction = time - (_self get "lastActionTime");
private _timeUntilIdle   = round(SQFM_idleStateTimeLimitSeconds-_timeSinceAction);
private _idleNow         = (_self get "state")isEqualTo"idle";
private _status          = [_timeUntilIdle," seconds left"]joinString"";

if (_timeUntilIdle > 60) then{_status = [round(_timeUntilIdle/60)," minutes left"]joinString""};
if (_idleNow)            then{_status = "idle"};
if!(_available)          then{_status = "Currently occupied"};

private _text = [_subCategoryTitle, "Idle status: ", _end, _subCategoryText, _status, _end]joinString"";;

_text;