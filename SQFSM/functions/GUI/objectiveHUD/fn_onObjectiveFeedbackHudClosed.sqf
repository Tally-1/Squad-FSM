params [
    ["_display",  nil, [displayNull]],
    ["_exitCode", nil,           [0]]
];
private _data      = _display getVariable "SQFM_data";
private _camera    = _data get "camera";
private _dummy     = _data get "camTarget";
private _mapImgBox = _data get "mapImgBox";

SQFM_terminatedCams pushBackUnique [_camera, round time+10];
deleteVehicle _dummy;
_mapImgBox call ["delete"];

if(SQFM_debugMode)then{
    systemChat "Objective feedback HUD closed";
    systemChat str ([count SQFM_terminatedCams, " cameras waiting for deletion"]joinString"");
};

true;