// Contains global variables used all over the mod.
// I may turn it into a hashmap to allow for OOP programming.

private _objectiveRanges  = (entities "SQFSM_Objective")apply{_x getVariable "activationDistance"};
private _maxObjRange      = selectMax _objectiveRanges;
private _SfsmDeactivated  = missionNamespace getVariable ["SFSM_disableSoldierFSM", false];
private _SFSM             = (!isNil "SFSM_fnc_debugMessage") && {_SfsmDeactivated isEqualTo false};
private _transportSides   = [];

{
	private _side = call compile(_x getVariable "sqfm_side");
	_transportSides pushBackUnique _side} 

forEach (entities "SQFSM_TransportSpawner");

if((-1) in _objectiveRanges
or{_objectiveRanges isEqualTo []})
then{_maxObjRange = worldSize};

missionNamespace setVariable ["SQFM_soldierFsmOn", _SFSM, true];

SQFM_headlessPresent     = (entities "HeadlessClient_F") isNotEqualTo [];
SQFM_transportModules    = entities "SQFSM_TransportSpawner";
SQFM_transportSides      = _transportSides;
SQFM_maxObjectiveRange   = _maxObjRange;
SQFM_validSides          = [east, west, independent];
SQFM_currentMapObjective = objNull;
SQFM_currentMapSquad     = grpNull;
SQFM_newGroups           = [];
SQFM_deadGroups          = [];
SQFM_battleList          = [];
SQFM_battles             = createHashmapObject [[]];
SQFM_reinforRequests     = createHashmapObject [[]];
SQFM_artilleryRequests   = createHashmapObject [[]];
SQFM_activeArtyRequests  = createHashmapObject [[]];
SQFM_maxBattleSize       = 1000;
SQFM_minBattleSize       = 150;
SQFM_lastBuildingChange  = 0;
SQFM_safePosLifeTime     = 60;
SQFM_spawnCooldown       = 10;
SQFM_lastFireCheck       = 0-300;
SQFM_BattleDebugHouses   = false;

/******************{ARRAY ORDER: TIME ADDED}******************/
SQFM_defaultBehaviour    = [ 
	"standard",                                    // Squadtype
	SQFM_defaultBehaviourDefend,                   // defend objectives
	SQFM_defaultBehaviourAttack,                   // Attack objectives 
	SQFM_defaultBehaviourPush,                     // push near enemies 
	SQFM_defaultBehaviourPushDist,                 // push distance 
	SQFM_defaultBehaviourPushKnowledge,            // push knowledge 
	SQFM_defaultBehaviourReinforce,                // reinforce 
	SQFM_defaultBehaviourCallReforce,              // call reinforcements 
	SQFM_defaultBehaviourCallArty,                 // call Arty
	SQFM_defaultBehaviourExcluded,                 // Exclude from Squad FSM
	SQFM_defaultBehaviourClear,                    // clear Objectives 
	SQFM_defaultBehaviourCanIdleCover,             // When a squad is considered Idle it will look for good positions to take cover
	SQFM_defaultBehaviourCallTransport,            // Can call transport
	SQFM_defaultBehaviourUseNearVehiclesTransport, // Can use near vehicles for transport
	SQFM_defaultBehaviourForceTravelOnFoot,        // Force Travel on foot when no transport is available
	SQFM_defaultBehaviourAllowBattleTask           // Allow squads to Push, flank or Hold during battle (may interfere with FIPOs)
];

[missionNamespace, "SQFM_taskGroups",         [],                      true] call setGlobalVar;
[missionNamespace, "SQFM_transportSides",     _transportSides,         true] call setGlobalVar;
[missionNamespace, "SQFM_battles",            SQFM_battles,            true] call setGlobalVar;
[missionNamespace, "SQFM_reinforRequests",    SQFM_reinforRequests,    true] call setGlobalVar;
[missionNamespace, "SQFM_reinforRequests",    SQFM_artilleryRequests,  true] call setGlobalVar;
[missionNamespace, "SQFM_activeArtyRequests", SQFM_activeArtyRequests, true] call setGlobalVar;
[missionNamespace, "SQFM_spawnCooldown",      SQFM_spawnCooldown,      true] call setGlobalVar;
[missionNamespace, "SQFM_maxObjectiveRange",  SQFM_maxObjectiveRange,  true] call setGlobalVar;

call SQFM_fnc_globalizeBattles;