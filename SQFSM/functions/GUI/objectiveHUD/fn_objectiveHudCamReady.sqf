params [
    ["_timeLimit",nil,[0]]
];
if(time > _timeLimit) exitWith{true};
if(isNil "_self")     exitWith{true};

private _display = _self get "display";
if(isNil "_display") exitWith{true};
if(isNull _display)  exitWith{true};

private _camera = _self get "camera";
if(isNull _camera)exitWith{true};

camCommitted _camera;