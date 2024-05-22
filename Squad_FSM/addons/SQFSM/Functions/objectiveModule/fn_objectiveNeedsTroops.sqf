params[
    ["_side",   nil,     [""]], // ["west","east","independent"]
    ["_attack", false,[false]]
];

if(isNil "_side")exitWith{
    "Side was not passed to 'needsTroops'"call dbgm;
    false;
};

private _strengthNeeded   = _self get "assetStrength";
private _assignedStrength = (_self call ["getAssignedAssets", [_side]])get"sum";

if(_attack)then{_strengthNeeded=_strengthNeeded*2};

private _moreNeeded = _assignedStrength < _strengthNeeded;

_moreNeeded;