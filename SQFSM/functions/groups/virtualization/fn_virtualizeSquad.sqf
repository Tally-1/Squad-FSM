params[
    ["_group",     nil,[grpNull]],
    ["_deleteAll", nil,   [true]]
];
private _data            = _group call getData;
private _vehicles        = _data call ["getVehiclesInUse"];
private _men             = _data call ["getUnits"];
private _virtualMen      = _men apply {[_x] call SQFM_fnc_virtualizeMan};
private _virtualVehicles = _vehicles apply {[_x] call SQFM_fnc_virtualizeVehicle};
private _settings        = createHashmapObject [[
    ["canDefend",                         _data get "canDefend"],
    ["canAttack",                         _data get "canAttack"],
    ["canHunt",                             _data get "canHunt"],
    ["huntDistance",                   _data get "huntDistance"],
    ["huntKnowledge",                 _data get "huntKnowledge"],
    ["canReinforce",                   _data get "canReinforce"],
    ["canCallReinforcements", _data get "canCallReinforcements"],
    ["canCallAir",                       _data get "canCallAir"],
    ["canCallArty",                     _data get "canCallArty"]
]];

private _dataArr = [
    ["side",                      side _group],
    ["settings",                    _settings],
    ["men",                       _virtualMen],
    ["vehicles",             _virtualVehicles],

    /**********************{METHODS}**********************/
    ["spawnIn",  SQFM_fnc_virtualSquadSpawnIn]
];


if(_deleteAll)then{
    {deleteVehicle _x} forEach _men;
    {deleteVehicle _x} forEach _vehicles;
    deleteGroup _group;
};

private _virtualSquad = createHashmapObject [_dataArr];

_virtualSquad;