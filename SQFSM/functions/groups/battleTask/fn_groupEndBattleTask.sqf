params[
    ["_group",nil,[grpNull]]
];
private _data = _group call getData;
if(isNil "_data")exitWith{};

private _task = _data get "battleTask";
if(isNil "_task")exitWith{};

_task call ["end",[false]];

true;