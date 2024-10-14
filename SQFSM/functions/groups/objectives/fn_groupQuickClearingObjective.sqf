params [
    ["_objective",  nil, [objNull]],
    ["_wpFunction", nil,      [""]],
    ["_action",     nil,      [""]]
];
private _objData = _objective call getData;
private _zone    = _objData get "zone";
private _pos     = _zone#0;
private _rad     = _zone#1;
private _roadMap = _objData get "roadmap";
private _roads   = _roadMap get "positions";
private _endPos  = selectRandom _roads;

_self set  ["action", _action];

if(isNil "_endPos")exitWith{
	private _placementRad  = _rad*0.3;
	private _completionRad = _rad*0.5;
    _self call ["addWaypoint", [_pos,_completionRad,"MOVE",_wpFunction, "AWARE", "NORMAL", _placementRad]];
};


_self call ["addWaypoint", [_endPos,30,"MOVE",_wpFunction, "AWARE", "NORMAL", 10]];

true;