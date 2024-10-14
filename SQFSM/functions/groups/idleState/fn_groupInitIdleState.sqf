params[
    ["_takenPositions",[],[[], createHashmap]]
];
_self call ["update"];
if!("idle" in (_self get "state"))exitWith{};

_self set["action","Idle"];

if!(_self call ["canIdleGarrison"])exitWith{};
if!(_self get "canIdleCover")      exitWith{};

private _groupPos = _self call ["getAvgPos"];
private _coverPos = _self call ["getIdleCoverArea",[_takenPositions]];
private _distance = _groupPos distance2D _coverPos;

if(_distance < 75)exitWith{
    _self call["idleCover"];
    _coverPos;
};

_self call ["deleteWaypoints"];
_self call ["unStop"];
_self call ["addWaypoint",[_coverPos,10,"MOVE","SQFM_fnc_waypointIdleCover"]];
_self set  ["action", "moving to idle cover"];

_coverPos;