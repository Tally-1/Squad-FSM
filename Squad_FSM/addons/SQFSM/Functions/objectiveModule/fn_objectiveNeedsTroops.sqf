params[
    ["_side",nil,[""]] // ["west","east","independent"]
];

if(isNil "_side")exitWith{
    "Side was not passed to 'needsTroops'"call dbgm;
    false;
};

private _wantedAsset    = _self get "asset";
private _wantedCount    = _self get "count";
private _assignedAssets = _self call ["getAssignedAssets",[_side]];
private _assignedCount  = _assignedAssets get _wantedAsset;

if(isNil "_assignedCount")then{_assignedCount = 0;};

private _moreNeeded     = _assignedCount < _wantedCount;

_moreNeeded;