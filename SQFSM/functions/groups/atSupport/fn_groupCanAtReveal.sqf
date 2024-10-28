private _taskData = _self call ["getTaskData"];
(_taskData get"params")params[
    ["_target",nil,    [objNull]],
    ["_caller",grpNull,[grpNull]]
];
private _group       = _self get "grp";
private _targetKnown = _group knowsAbout _target >= 3.7;
if(_targetKnown)exitWith{false};

private _vehicleGrp = _self call ["isVehicleGroup"];
if(_vehicleGrp)exitWith{true};

private _visible = _self call ["targetVisible",[_target]];
if(_visible)exitWith{true};

false;