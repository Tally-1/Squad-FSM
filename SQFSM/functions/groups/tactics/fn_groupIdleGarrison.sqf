params[
    ["_pos",nil,[[]]]
];
private _groupPos = _self call ["getAvgPos"];
private _distance = _pos distance2D _groupPos;
private _function = "SQFM_fnc_waypointIdleGarrison";

if(_distance < 50)exitWith{
    _self spawn {_this call["garrison",["Idle Cover Garrison"]]};
};

_self call ["deleteWaypoints"];
_self call ["unStop"];
_self call ["addWaypoint",[_pos,10,"MOVE",_function]];
_self set  ["action", "moving to garrison"];

true;