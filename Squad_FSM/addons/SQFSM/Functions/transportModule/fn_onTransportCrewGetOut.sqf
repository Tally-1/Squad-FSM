_this spawn { 
params [
    ["_unit",    nil, [objNull]],
    ["_role",    nil,      [""]],
    ["_vehicle", nil, [objNull]]
];
"Transport crew got out of vehicle" call dbgm;

sleep 0.1;

private _noCrew = [_vehicle] call SQFM_fnc_deadCrew;
if!(_noCrew)exitWith{};

_vehicle setVariable ["SQFM_abandonTransportTime", round time];

private _group = group _unit;
if!([_group] call SQFM_fnc_validGroup)exitWith{};

private _data = _group call getData;
if!(_data call ["canReplenish"])exitWith{};

private _pos    = _data call ["getAvgPos"];
private _zone   = [_pos, 5000];
private _groups = _zone call SQFM_fnc_groupsInZone select {_data call ["canReplenishGroup",[_x]]};

if(_groups isEqualTo [])exitWith{};

private _targetGroup = [_pos, _groups] call SQFM_fnc_getNearestGroup;
_data call ["replenishGroup",[_targetGroup]];

true;
}