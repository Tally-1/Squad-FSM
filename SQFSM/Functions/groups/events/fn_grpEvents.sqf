params [["_group", nil, [grpNull]]];
private _data = _group call getData;

_group addEventHandler ["Empty",            {SQFM_deadGroups pushBackUnique (_this#0)}];
_group addEventHandler ["EnemyDetected",         {_this call SQFM_fnc_onEnemyDetected}];
_group addEventHandler ["KnowsAboutChanged", {_this call SQFM_fnc_onKnowsAboutChanged}];
_group addEventHandler ["UnitJoined",               {_this call SQFM_fnc_onUnitJoined}];
_group addEventHandler ["WaypointComplete",   {_this call SQFM_fnc_onWaypointComplete}];
_group addEventHandler ["CombatModeChanged", {_this call SQFM_fnc_onCombatModeChanged}];



_data call ["addUnitEH", ["FiredMan",     {_this call SQFM_fnc_onSquadManFired},              "SQFM_squadManFired"]];
_data call ["addUnitEH", ["Suppressed",   {_this call SQFM_fnc_onSquadManSuppressed},    "SQFM_squadManSuppressed"]];
_data call ["addUnitEH", ["HandleDamage", {_this call SQFM_fnc_handleNoCrashDamage},  "SQFM_squadManDamageHandler"]];
_data call ["addUnitEH", ["GetOutMan",    {_this call SQFM_fnc_onSquadManGetOut},            "SQFM_squadManGetOut"]];

true;