call SQFM_fnc_initgameState;
call SQFM_fnc_initSettings;
call SQFM_fnc_groupSpawnedEh;
call SQFM_fnc_projectileCreated;
// call SQFM_fnc_initAllTransportModules;

{[_x] call SQFM_fnc_initGroup;} forEach allGroups;
{[_x] call SQFM_fnc_initObjective;} forEach entities "SQFSM_Objective";
{[_x] call SQFM_fnc_initTransportSpawner} forEach (entities "SQFSM_TransportSpawner");

[] spawn SQFM_fnc_taskManager;
[] spawn {
	waitUntil { sleep 1; time>10};
	call SQFM_fnc_assignAllGroupsToObjective;
};

true;