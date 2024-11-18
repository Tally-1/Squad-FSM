private _type         = "unknown";
private _data         = group player call getData;
private _incoming     = _data get "incomingReforce";

private _reforceGroup = _incoming#0;
if(isNil "_reforceGroup")
exitWith{_type};

private _reforceData  = _reforceGroup call getData;
if(isNil "_reforceData")
exitWith{_type};

_type = _reforceData get "groupType";

_type;