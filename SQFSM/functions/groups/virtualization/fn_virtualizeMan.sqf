params[
    ["_man",nil,[objNull]]
];
private _vehicle   = vehicle _man;
private _vehicleId = "";

if(_man != _vehicle)
then{_vehicleId = getObjectID _vehicle};

private _dataArr = [
    ["id",                  getObjectID _man],
    ["var",                         str _man],
    ["type",                     typeOf _man],
    ["rank",                       rank _man],
    ["side",                 side group _man],
    ["loadOut",          getUnitLoadout _man],
    ["pos",             getPosATLVisual _man],
    ["dir",                getDirVisual _man],
    ["vehicleRole", assignedVehicleRole _man],
    ["vehicleId",                 _vehicleId],

            /**{METHODS}**/
    ["spawnIn",           SQFM_fnc_virtualManSpawnIn],
    ["getVehicle",     SQFM_fnc_virtualManGetVehicle],
    ["getInVehicle", SQFM_fnc_virtualManGetInVehicle]
];

private _virtualMan = createHashmapObject [_dataArr];

_virtualMan;