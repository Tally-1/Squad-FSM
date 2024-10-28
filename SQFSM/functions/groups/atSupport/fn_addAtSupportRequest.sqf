params[
    ["_group",  nil, [grpNull]],
    ["_target", nil, [objNull]]
];
private _side        = side _group;
private _requestList = SQFM_atSupportRequests get _side;
private _reqGroups   = _requestList apply {_x#1};
private _reqCount    = count (_reqGroups select {_x isEqualTo _group});
private _request     = [_group, _target, round time];

if(_reqCount >= 2)exitWith{
    [["Found ",_reqCount," AT requests from", groupId _group, " ignoring last"]] call dbgm;
    false;
};

[["AT-support request recieved from ", groupId _group]]call dbgm;

_requestList pushBackUnique _request;