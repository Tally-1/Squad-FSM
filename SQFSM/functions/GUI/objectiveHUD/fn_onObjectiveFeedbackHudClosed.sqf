params [
    ["_display",  nil, [displayNull]],
    ["_exitCode", nil,           [0]]
];
private _data      = _display getVariable "SQFM_data";
private _camera    = _data get "camera";
private _dummy     = _data get "camTarget";
private _mapImgBox = _data get "mapImgBox";

_camera cameraEffect ["terminate","back"];
camDestroy _camera;
deleteVehicle _dummy;
_mapImgBox call ["delete"];

// [[name player," closed objective feedback HUD at ",round time]] call dbgm;

true;