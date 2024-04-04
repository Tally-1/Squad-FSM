params[
    ["_side",nil,[""]] // ["west","east","independent"]
];
private _wantedAsset    = _self get "asset";
private _wantedCount    = _self get "count";
private _assignedAssets = _self call ["getAssignedAssets",[_side]];
private _assignedCount  = _assignedAssets get _wantedAsset;
private _moreNeeded     = _assignedCount < _wantedCount;

_moreNeeded;