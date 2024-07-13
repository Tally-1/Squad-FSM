params[
	["_enemyGrp", nil, [grpNull]]
];
_self call ["deleteWaypoints"];

private _enemydata  = _enemyGrp call getData;
private _enemyPos   = _enemydata call ["getAvgPos"];
private _startPos   = _self call ["getAvgPos"];
private _distance   = (_startPos distance2D _enemyPos)*1.1;
private _zone       = [_startPos, _distance];
private _enemyType  = _enemyData get "groupType";
private _taskName   = ["Hunting ", _enemyType]joinString"";
private _params     = [_startPos, _enemyPos, _enemyGrp];
private _onSearchWp = '[group this] call SQFM_fnc_onGroupHuntWp';
private _endCode    = SQFM_fnc_onGroupHuntEnd;

_self call ["addWaypoint", [_enemyPos, 20, "MOVE", _onSearchWp]];
_self call ["initTask", [_taskName, _zone, [], _params, {}, _endCode]];

_self set  ["action", _taskName];

true;