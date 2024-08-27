_this spawn{
sleep 0.1;
params[
    ["_group",nil,[grpNull]]
];
private _self     = _group call getData;
private _vehicles = _self call ["getVehiclesInUse"];
private _men      = _self call ["getUnitsOnfoot"];
if(_vehicles isEqualTo [])exitWith{};
if(_men      isEqualTo [])exitWith{};

private _formationLeader = formationLeader leader _group;
private _leaderVehicle   = vehicle _formationLeader;
private _driver          = driver _leaderVehicle;

if(!alive _driver)                            exitWith{};
if([_driver] call SQFM_fnc_unconscious)       exitWith{};
if(_formationLeader isEqualTo _leaderVehicle) exitWith{};
if([_leaderVehicle] call SQFM_fnc_deadCrew)   exitWith{};

_driver disableAI "path";
_group setSpeedMode "FULL";

[_men]           call SQFM_fnc_enforceFormation;
[_group,50,true] call SQFM_fnc_searchNearBuildings;
[_men]           call SQFM_fnc_enforceFormation;

private _wp = _self call ["currentWaypoint"];

_group setSpeedMode "LIMITED";
_driver enableAI "path";
_group setFormDir getDir _leaderVehicle;

if(!isNil "_wp")
then{_driver doMove (waypointPosition _wp)};

};