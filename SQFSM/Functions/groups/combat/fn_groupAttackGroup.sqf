params[
    ["_targetGroup",nil,[grpNull]]
];
_self call ["deleteWaypoints"];

private _targetData = _targetGroup call getData;
private _pos        = _targetData call ["getAvgPos"];
private _mechanized = _self call ["isMechanized"];

if(isNil "_pos")then{_pos = getPos leader _targetGroup};
if!(_mechanized)
exitWith{_self call["addWaypoint",[_pos, 50, "SAD"]]};

[_self, _pos]spawn{
params["_self","_pos"];

_self call ["initMechClearing"];
_self call ["addWaypoint", [_pos, 50, "MOVE", "SQFM_fnc_wpEndMechClearing"]];

true;
};