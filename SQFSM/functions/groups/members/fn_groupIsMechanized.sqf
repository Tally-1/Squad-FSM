_self call ["update"];

private _squadType  = _self get "groupType";
private _mixedGroup = "(infantry)" in _squadType;
if!(_mixedGroup)exitWith{false};

private _vehicle = vehicle formationLeader leader (_self get "grp");
private _valid   = [_vehicle] call SQFM_fnc_validVehicle;
if!(_valid)exitWith{false};

true;