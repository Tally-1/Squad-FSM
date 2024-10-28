params[
    ["_target",nil,[objNull]]
];
private _group = _self get "grp";

_self set ["lastAtSupReq",round time];
_target setVariable["SQFM_lastAtTargetCall",round time,true];

SQFM_atSupportRequests call ["addRequest",[_group, _target]];

private _status = ["AT-support called by", groupId _group, " on ", typeOf _target, " at ", time]joinString"";
_status call dbgm;


true;