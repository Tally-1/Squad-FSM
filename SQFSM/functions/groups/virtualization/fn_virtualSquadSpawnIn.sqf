private ["_group"];
private _men      = [];
private _vehicles = [];

isNil{
    _group = createGroup (_self get "side");
    {_vehicles pushBack (_x call ["spawnIn"])}          forEach(_self get "vehicles");
    {_men      pushBack (_x call ["spawnIn",[_group]])} forEach(_self get "men");
};

private _timer = time+3;
private _data  = _group call getData;
waitUntil{
    _data = _group call getData;
    (!isNil "_data")||{time > _timer};
};

{_data set [_x,_y]} forEach (_self get "settings");

_group;