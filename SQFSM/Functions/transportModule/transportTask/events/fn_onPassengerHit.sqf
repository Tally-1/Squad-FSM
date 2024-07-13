params [
    ["_man",   nil, [objNull]],
    ["_enemy", nil, [objNull]]
];
private _valid = [_enemy] call SQFM_fnc_validLandEntity;
if!(_valid)exitWith{};

private _hostile = [_man, _enemy] call SQFM_fnc_hostile;
if!(_hostile)exitWith{};

private _data           = (group _man) call getData;
private _vehicle        = _data get "transportVehicle";
private _transportGroup = group driver _vehicle;

"Passenger got hit during transport" call dbgm;
private _taskData       = (_transportGroup call getData)get "taskData";

if(!isNil "_taskData")then{ 
    _taskData set  ["enemy", _enemy];
    _taskData call ["abort", ["combat"]];
};

true;