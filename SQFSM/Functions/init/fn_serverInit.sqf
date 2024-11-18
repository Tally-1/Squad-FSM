call SQFM_fnc_initgameState;
call SQFM_fnc_initSettings;
call SQFM_fnc_groupSpawnedEh;
call SQFM_fnc_projectileCreated;
call SQFM_fnc_entityKilledEh;
call SQFM_fnc_ACE_MedicalEvents;
call SQFM_fnc_curatorEvents;
call SQFM_fnc_buildingChangedEh;
call SQFM_fnc_initReinforRequestsMap;
call SQFM_fnc_initAtSupportRequestsMap;
call SQFM_fnc_playerConnectedEh;

{[_x] call SQFM_fnc_initGroup}            forEach allGroups;
{[_x] call SQFM_fnc_initObjective}        forEach (entities "SQFSM_Objective");
{[_x] call SQFM_fnc_initTransportSpawner} forEach (entities "SQFSM_TransportSpawner");
{[_x] call SQFM_fnc_initReforceModule}    forEach (entities "SQFSM_Reforcer");

[] spawn SQFM_fnc_taskManager;
[] spawn {
	waitUntil { sleep 1; time>10};
	call SQFM_fnc_assignAllGroupTasks;
};

["SQFM_ObjectiveActiveChange", {_this call SQFM_fnc_objectiveOnActiveChange}] call CBA_fnc_addEventHandler;
["SQFM_playerCallReforce",     {_this call SQFM_fnc_playerCallReforceServer}] call CBA_fnc_addEventHandler;
["SQFM_playerAbortReforce",   {_this call SQFM_fnc_playerAbortReforceServer}] call CBA_fnc_addEventHandler;

missionNamespace setVariable ["SQFM_Dedicated",    isDedicated, true];
missionNamespace setVariable ["SQFSM_serverReady", true,        true];

if(isDedicated)
then{enableEnvironment false};

true;