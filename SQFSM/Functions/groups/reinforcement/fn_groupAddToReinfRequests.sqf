private _group       = _self get"grp";
private _pos         = _self get"groupCluster"get"position";
private _request     = [_pos, _group, round time];

SQFM_reinforRequests call ["addRequest", _request];


true;