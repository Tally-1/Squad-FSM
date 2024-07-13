(_self get "params")
params[
	["_startPos", nil,     [[]]],
	["_enemyPos", nil,     [[]]],
	["_enemyGrp", nil,[grpNull]]
];
private _data = _self call ["ownerData"];

_data call ["addWaypoint", [_startPos, 10, "MOVE"]];
_data set  ["action",                           ""];
_data set  ["state",                            ""];
_self set  ["huntCoolDown",               time+120];

"Group ended hunt" call dbgm;

true;