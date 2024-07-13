params[
    ["_pos",   nil,      [[]]],
    ["_group", nil, [grpNull]],
    ["_time",  nil,       [0]]
];
private _side        = side _group;
private _requestList = SQFM_reinforRequests get _side;
private _reqGroups   = _requestList apply {_x#1};
private _request     = [_pos, _group, _time];

if(_group in _reqGroups)exitWith{
    [["Double request for reinf ", str _group, " deleting last"]] call dbgm;
    false;
};

_requestList pushBackUnique _request;