params [["_group", nil, [grpNull]]];

_group addEventHandler ["Empty",            {SQFM_deadGroups pushBackUnique (_this#0)}];
_group addEventHandler ["EnemyDetected",    {_this call SQFM_fnc_onEnemyDetected}];
_group addEventHandler ["KnowsAboutChanged",{_this call SQFM_fnc_onKnowsAboutChanged}];
_group addEventHandler ["UnitJoined", {
	params ["_group", "_newUnit"];
	_data = _group call getData;
	if(isNil "_data")exitWith{};
	_data call ["update"];
}];


true;