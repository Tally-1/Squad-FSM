params [
    ["_group", nil, [grpNull]],
    ["_index", nil,       [0]]
];
private _wp        = [_group, _index];
private _statement = (waypointStatements _wp)#1;
if!("SQFM" in _statement)exitWith{};

private _data       = _group call getData;
private _owner      = _data get "owner";
private _function   = _statement select [24, count _statement];

if(_owner isEqualTo 0)then{_owner = 2};

[["Waypoint complete. Function: ", _function, "| Owner: ",_owner]] call dbgS;
private _callString = ["[_group] remoteExecCall [", _function,", ",_owner,"];"]joinString"";
call compile _callString;

true;