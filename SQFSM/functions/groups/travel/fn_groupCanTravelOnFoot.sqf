params[
    ["_targetPos",nil,[[]]]
];
private _vehicleGroup = _self call ["isVehicleGroup"];
if(_vehicleGroup)exitWith{false};

private _ignoreDistance = _self get "forceTravelOnFoot";
if(_ignoreDistance)exitWith{true};

private _distance = _targetPos distance2D (_self call ["getAvgPos"]);
private _tooFar   = _distance > SQFM_travelWalkDist;
if(_tooFar)exitWith{false};

true;