params[
	["_pos",       nil,[[]]], // Waypoint position.
    ["_radius",    nil, [0]], // completion radius
    ["_type",      nil,[""]], // waypoint type 
    ["_statement", nil,[""]], // Name of function to be executed on completion "SQFM_fnc_exampleFnc"
    ["_behaviour", nil,[""]], // Combatmode
	["_speed",     nil,[""]], // Group speedMode
    ["_randomRad", 0,   [0]]  // placement radius
];

private _group     = _self get "grp";
private _groupData = _group getVariable "SQFM_grpData";
if(isNil "_groupData"&&{!canSuspend})exitWith{};
if(isNil "_groupData")then{
    private _timer = time+10;
    waitUntil{
        sleep 1;
        _groupData = _group getVariable "SQFM_grpData";
        if(!isNil "_groupData")exitWith{true};
        if(_timer<time)exitWith{true};
        false;
    };
};

private _wayPoint  = _group addWaypoint [_pos, _randomRad];
private _recon     = (_groupData get "squadClass") isEqualTo "recon";
private _setBehaviour = (!isNil "_behaviour") && {!_recon};

if(!isNil "_radius")    then {_wayPoint setWaypointCompletionRadius _radius};
if(!isNil "_type")      then {_wayPoint setWaypointType _type;};
if(_setBehaviour)       then {_wayPoint setWaypointBehaviour _behaviour;};
if(!isNil "_speed")     then {_wayPoint setWaypointSpeed _speed;};
if(!isNil "_statement") then {
    _statement = ['comment "SQFM"; comment "',_statement,'"']joinString"";
    _wayPoint setWaypointStatements ["true", _statement];
};

_self call ["unStop"];
_self call ["reconUpdate",[true]];

_wayPoint;