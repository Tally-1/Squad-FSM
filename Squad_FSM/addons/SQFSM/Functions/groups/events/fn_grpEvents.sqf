params [["_group", nil, [grpNull]]];

_group addEventHandler ["Empty",             {SQFM_deadGroups pushBackUnique (_this#0)}];
_group addEventHandler ["EnemyDetected",     {_this call SQFM_fnc_onEnemyDetected}];
_group addEventHandler ["KnowsAboutChanged", {_this call SQFM_fnc_onKnowsAboutChanged}];

true;