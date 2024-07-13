params[
    ["_targetGroup",nil,[grpNull]]
];
_self call ["deleteWaypoints"];

private _targetData = _targetGroup call getData;
private _pos        = _targetData call ["getAvgPos"];

if(isNil "_pos")then{_pos = getPos leader _targetGroup};

private _statement  = '(group this call getData) set ["action",""]';
_self call ["addWaypoint", [_pos, 50, "SAD"]];

true;