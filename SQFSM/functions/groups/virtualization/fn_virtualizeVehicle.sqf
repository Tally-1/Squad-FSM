params[
    ["_vehicle",nil,[objNull]]
];
private _dataArr = [
    ["id",        getObjectID _vehicle],
    ["var",               str _vehicle],
    ["type",           typeOf _vehicle],
    ["side",       side group _vehicle],
    ["pos",   getPosATLVisual _vehicle],
    ["dir",      getDirVisual _vehicle],

    /****************{METHODS}**********************/
    ["spawnIn",       SQFM_fnc_virtualVehicleSpawnIn]
];

private _virtualVehicle = createHashmapObject [_dataArr];

_virtualVehicle;