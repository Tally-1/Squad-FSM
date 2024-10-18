params[
    ["_forced",false,[true]]
];
if(_forced)then{
    {
        private _cam = SQFM_terminatedCams#0#0;
        if(isNil "_cam")exitWith{SQFM_terminatedCams deleteAt 0};
        
        _cam cameraEffect ["terminate","back"];
        camDestroy _cam;
        deleteVehicle _cam;
        SQFM_terminatedCams deleteAt 0;

    }forEach SQFM_terminatedCams
};

if(SQFM_terminatedCams isEqualTo [])exitWith{};

if((!isNull (findDisplay 312))
&&{_forced isEqualTo false})exitWith{};

private _forceDelete   = (count SQFM_terminatedCams > 7)or{_forced};
private _displayActive = !isNull(uiNameSpace getVariable ["SQFM_markerFeedBack",displayNull]);
if(_displayActive
&&{_forceDelete isEqualTo false})exitWith{};

private _camCount    = count SQFM_terminatedCams;
private _deleteCount = 0;

for "_i"from 0 to _camCount-1 do { 
    private _camera = SQFM_terminatedCams#0#0;
    if(isNil "_camera")    exitWith{};
    // if(isNull _camera)     exitWith{};

    private _deleteTime  = SQFM_terminatedCams#0#1;    

    if(_deleteTime > time
    &&{_forceDelete isEqualTo false}) exitWith{};

	_camera cameraEffect ["terminate","back"];
	camDestroy _camera;
    // deleteVehicle _camera;
    SQFM_terminatedCams deleteAt 0;

    _deleteCount = _deleteCount+1;
    _forceDelete = (count SQFM_terminatedCams > 7)or{_forced};
};

if(_deleteCount < 1)exitWith{};
if!(SQFM_debugMode) exitWith{};

private _feedBack = ["Deleted ",_deleteCount," cameras"]joinString"";
systemChat _feedBack;

true;