params[
	["_pos",       nil,[[]]],
    ["_radius",    nil, [0]],
    ["_type",      nil,[""]],
    ["_statement", nil,[""]],
    ["_behaviour", nil,[""]],
	["_speed",     nil,[""]]
];

private _group     = _self get "grp";
private _wayPoint  = _group addWaypoint [_pos, 0];

if(!isNil "_radius")    then {_wayPoint setWaypointCompletionRadius _radius};
if(!isNil "_type")      then {_wayPoint setWaypointType _type;};
if(!isNil "_statement") then {_wayPoint setWaypointStatements ["true", _statement];};
if(!isNil "_behaviour") then {_wayPoint setWaypointBehaviour _behaviour;};
if(!isNil "_speed")     then {_wayPoint setWaypointSpeed _speed;};

_wayPoint;