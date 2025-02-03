private _timeSince = time - (_self get "lastGlobal");
if(_timeSince < 1)exitWith{};

_self set ["lastGlobal", time];

private _keyValArr = [_self] call SQFM_fnc_hashToNoCodeArr;
private _group     = _self get "grp";

[_group, _keyValArr] remoteExec ["SQFM_fnc_applyGroupKeyValArr",-clientOwner];


true;