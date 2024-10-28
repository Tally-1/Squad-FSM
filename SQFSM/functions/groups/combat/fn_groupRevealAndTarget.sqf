params[
    ["_target",nil,    [objNull]]
];
private _group       = _self get "grp";
private _knowsTarget = _group knowsAbout _target >= 3.7;
private _infantryGrp = _self call ["isInfantryGroup"];

if(_infantryGrp)
exitWith{_self call ["infEngageAtTarget",[_target]]};

if!(_knowsTarget)
then{_self call["revealTargets",[[_target],4]]};

private _type        = toLower(_self get "groupType");
private _vehicleGrp  = _self call ["isVehicleGroup"];


if(_vehicleGrp)exitWith{
    private _vehicles = _self call ["getGrpMembers"];
    {[_x, _target] call SQFM_fnc_vehicleEngageTarget} forEach _vehicles;
};

true;