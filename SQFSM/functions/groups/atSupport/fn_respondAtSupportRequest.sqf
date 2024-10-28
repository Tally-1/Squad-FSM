params[
    ["_caller",     nil, [grpNull]],
    ["_target",     nil, [objNull]],
    ["_time",       nil,       [0]],
    ["_excluded",   nil,      [[]]]
];
private _invalidTarget = !([_target]call SQFM_fnc_validAtTarget);
private _status          = ["AT-target assigned by", groupId _caller, " is no longer a valid target"]joinString"";
if(_invalidTarget)exitWith{_status call dbgm;grpNull};

private _hunterGrps = count(_target getVariable ["SQFM_hunterGrps", []]);
private _status          = ["AT-target assigned by", groupId _caller, " Already have 2 or more groups hunting it"]joinString"";
if(_hunterGrps >= 2)exitWith{_status call dbgm;grpNull};

private _callerSide      = side _caller;
private _availableGroups = [true] call SQFM_fnc_getAtSupportGroups select {side _x isEqualTo _callerSide &&{_caller != _x &&{!(_x in _excluded)}}};
private _status          = ["No AT-support groups available to respond to request from ", groupId _caller]joinString"";
if(_availableGroups isEqualTo [])exitWith{_status call dbgm;grpNull};

private _responder = selectRandom _availableGroups;
private _data      = _responder call getData;
private _status    = [groupId _responder, " is responding to AT-support request from ", groupId _caller]joinString"";

_data call ["initAtSupport",[_target]];
_status call dbgm;

_responder;