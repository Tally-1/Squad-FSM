params[
    ["_groupData",nil,[createHashmap]]
];

private _methods = [    
    ["3DIcon",                             SQFM_fnc_group3DIcon],
    ["3DColor",                           SQFM_fnc_group3DColor],
    ["setMethods",      {[_self] call SQFM_fnc_setGroupMethods}],
    ["debugText",                       SQFM_fnc_groupDebugText],
    ["flashAction",                   SQFM_fnc_groupFlashAction],
	["drawBattleIntel",           SQFM_fnc_groupDrawBattleIntel],
    ["setMapIcon",                     SQFM_fnc_groupSetMapIcon],
	["toggleExternalAi",         SQFM_fnc_groupToggleExternalAi],
    ["globalize",                   SQFM_fnc_groupGlobalizeData],

    /*************************{MISC}***************************/
    ["isIdle",                             SQFM_fnc_groupIsIdle],
    ["isValid",  {[(_self get "grp")] call SQFM_fnc_validGroup}],
    ["activeWp",                              SQFM_fnc_activeWp],
    ["update",                             SQFM_fnc_groupUpdate],
    ["setDataDelayed",             SQFM_fnc_groupSetDataDelayed],
    ["addUnitEH",             SQFM_fnc_groupAddUnitEventHandler],
    ["removeUnitEH",       SQFM_fnc_groupRemoveUnitEventHandler],
    ["drawOnMapMouseOver",     SQFM_fnc_groupDrawOnMapMouseOver],
    ["sinceSpawn",                 {time - (_self get "birth")}],
    ["reconUpdate",                   SQFM_fnc_groupReconUpdate],
    ["reconDangerMode",     SQFM_fnc_groupReconUpdateDangerMode],
    ["reconCallArty",               SQFM_fnc_groupReconCallArty],
    // ["availableForNewTask",      SQFM_fnc_groupAvailableForTask],
    // endPlayerTransport
    /**********************{TRAVEL}*****************************/

    ["canTravelOnFoot",           SQFM_fnc_groupCanTravelOnFoot],
    ["initTravel",                     SQFM_fnc_initGroupTravel],
    ["execTravel",                     SQFM_fnc_execGroupTravel],
    ["onArrival",                            SQFM_fnc_onArrival],
    ["isTraveling",                   SQFM_fnc_groupIsTraveling],
    ["deleteWaypoints",                      SQFM_fnc_deleteWps],
    ["getOwnVehicles",                SQFM_fnc_getGroupVehicles],
    ["getNearVehicles",              SQFM_fnc_nearGroupVehicles],
    ["allAvailableVehicles", SQFM_fnc_allAvailableGroupVehicles],
    ["leaveInvalidVehicles",      SQFM_fnc_leaveInvalidVehicles],
    ["validVehicle",                 SQFM_fnc_validGroupVehicle],
    ["getPickupPos",                    SQFM_fnc_groupPickupPos],
    ["addWaypoint",                   SQFM_fnc_groupAddWayPoint],
    ["currentWaypoint",           SQFM_fnc_groupCurrentWayPoint],

    ["forcedMoveStart",           SQFM_fnc_groupForcedMoveStart],
    ["forcedMoveEnd",               SQFM_fnc_groupForcedMoveEnd],

                      /*{transport}*/
    ["canCallTransport",           SQFM_fnc_groupCanCallTransport],
    ["callTransport",                 SQFM_fnc_groupCallTransport],
    ["endPlayerTransport",       SQFM_fnc_groupEndPlayerTransport],
    ["getTransportSpawner",     SQFM_fnc_groupGetTransportSpawner],
    ["sinceTransportCall", {time-(_self get "lastTransportCall")}],
    ["waitForTransportSpawn", SQFM_fnc_groupWaitForTransportSpawn],
    ["abortTransport",               SQFM_fnc_groupAbortTransport],

                      /*{boarding}*/
    ["canSelfTransport",         SQFM_fnc_groupCanSelfTransport],
    ["enoughTransportNear",   SQFM_fnc_enoughGroupTransportNear],
    ["canBoardNow",                   SQFM_fnc_groupcanBoardNow],
    ["boardingStatus",             SQFM_fnc_groupBoardingStatus],
    ["isBoarded",     {_self call["boardingStatus"]=="boarded"}],
    ["getBoardingMen",             SQFM_fnc_getGroupBoardingMen],
    ["boardVehicles",               SQFM_fnc_groupBoardVehicles],
    ["boardOwnVehicles",         SQFM_fnc_groupBoardOwnVehicles],
    ["boardAllAvailable",       SQFM_fnc_groupBoardAllAvailable],
    ["postBoarding",                 SQFM_fnc_postGroupBoarding],
    ["boardingStarted",           SQFM_fnc_groupBoardingStarted],
    ["boardingEnded",               SQFM_fnc_groupBoardingEnded],
    ["boardingFailed",             SQFM_fnc_groupBoardingFailed],
    ["endBoarding",                   SQFM_fnc_endGroupBoarding],
    ["boardThenTravel",           SQFM_fnc_groupBoardThenTravel],
    ["ejectAll",             SQFM_fnc_groupEjectFromAllVehicles],
    ["leaveUnarmedVehicles", SQFM_fnc_groupLeaveUnarmedVehicles],
    ["mechUnload",                     SQFM_fnc_groupMechUnload],

	/********************{OBJECTIVES}***************************/
	["validObjective",                       SQFM_fnc_group_validObjective],
    ["objectiveInRange",                    SQFM_fnc_groupObjectiveInRange],
    ["getNearObjectives",                  SQFM_fnc_groupGetNearObjectives],
    ["isInsideObjective",                  SQFM_fnc_groupIsInsideObjective],
    ["canAssignObjective",                SQFM_fnc_groupCanAssignObjective],
    ["canLeaveObjective",                  SQFM_fnc_groupCanLeaveObjective],
    ["assignObjective",                      SQFM_fnc_groupAssignObjective],
    ["unAssignObjective",                  SQFM_fnc_groupUnAssignObjective],
    ["autoAssignObjective",              SQFM_fnc_groupAutoAssignObjective],
    ["assignAttackObjective",          SQFM_fnc_groupAssignAttackObjective],
    ["assignDefenseObjective",        SQFM_fnc_groupAssignDefenseObjective],
    ["canAttackOnly",                             SQFM_fnc_groupAttackOnly],
    ["canDefendOnly",                             SQFM_fnc_groupDefendOnly],
    ["takeObjective",                          SQFM_fnc_groupTakeObjective],
    ["attackObjective",                      SQFM_fnc_groupAttackObjective],
    ["endObjectiveAttack",                SQFM_fnc_groupEndObjectiveAttack],
    ["onObjectiveArrival",                SQFM_fnc_groupOnObjectiveArrival],
    ["guardObjective",                        SQFM_fnc_groupGuardObjective],
    // ["guardObjectiveTakeCover",      SQFM_fnc_groupGuardObjectiveTakeCover],
	["canInitObjectiveDefense",      SQFM_fnc_groupCanInitObjectiveDefense],
	["initObjectiveDefense",            SQFM_fnc_groupInitObjectiveDefense],
    ["objectiveData",                          SQFM_fnc_groupObjectiveData],
    ["typeMatchObjective",                SQFM_fnc_groupTypeMatchObjective],
    ["objectiveHostile",                    SQFM_fnc_groupObjectiveHostile],
    ["objectiveFriendly",                  SQFM_fnc_groupObjectiveFriendly],
    ["objectiveInsertPos",                SQFM_fnc_groupObjectiveInsertPos],
    ["objectiveInsertPosStandard",SQFM_fnc_groupObjectiveInsertPosStandard],
    ["objectiveInsertPosDanger",    SQFM_fnc_groupObjectiveInsertPosDanger],
    ["objectiveAttackLoop",              SQFM_fnc_groupObjectiveAttackLoop],
    ["objectiveAssignedHostiles",  SQFM_fnc_groupObjectiveAssignedHostiles],

    ["clearObjective",                        SQFM_fnc_groupClearObjective],
    ["infClearObjective",                  SQFM_fnc_groupInfClearObjective],
    ["infClearUrbanObjective",        SQFM_fnc_groupInfClearUrbanObjective],
    ["getUrbanObjInfSearchP",          SQFM_fnc_groupGetUrbanObjInfSearchP],
    ["quickObjectiveClearing",        SQFM_fnc_groupQuickClearingObjective],

    ["mechClearObjective",                SQFM_fnc_groupMechClearObjective],
    ["mechClearUrbanObjective",      SQFM_fnc_groupMechClearUrbanObjective],
    ["initMechClearing",                    SQFM_fnc_groupInitMechClearing],
    ["endMechClearing",                      SQFM_fnc_groupEndMechClearing],

    ["vehicleClearObjective",          SQFM_fnc_groupVehicleClearObjective],
    ["vehicleClearUrbanObjective",SQFM_fnc_groupVehicleClearUrbanObjective],

    /**********************{REINFORCEMENTS}**********************/
    ["canGetReinforcements",    SQFM_fnc_groupCanCallReinforcements],
    ["ableToReinforce",               SQFM_fnc_groupAbleToReinforce],
// ["needsReinforcments",          SQFM_fnc_groupNeedsReinforcments],
    ["requestReinforcements",   SQFM_fnc_groupRequestReinforcements],
    ["callReinforcementRadio", SQFM_fnc_groupCallReinforcementRadio],
    ["addToReinfRequests",         SQFM_fnc_groupAddToReinfRequests],
    ["reinforce",                   SQFM_fnc_groupInitReinforceTask],
    ["onReinforceArrival",         SQFM_fnc_groupOnReinforceArrival],
    ["endReinforcing",                 SQFM_fnc_groupEndReinforcing],
    ["abortReinforcing",             SQFM_fnc_groupAbortReinforcing],
    ["reinforceInsertPos",         SQFM_fnc_groupReinforceInsertPos],

    /************************{TASKS}****************************/
    ["initTask",                              SQFM_fnc_initTaskData],
    ["canRecieveTask",              SQFM_fnc_groupCanRecieveNewTask],
    ["initObjectiveTask",           SQFM_fnc_groupInitObjectiveTask],
    ["getAbilities",      {[_self] call SQFM_fnc_getGroupAbilities}],
    ["removeTask",                         SQFM_fnc_groupRemoveTask],
    ["hasTask", {str(_self call ["getTaskData"]) isNotEqualTo "[]"}],
    ["getTaskData",  {[_self get "grp"] call SQFM_fnc_getGroupTask}],
    ["actionStatus",                     SQFM_fnc_groupActionStatus],
    ["updateTask",                         SQFM_fnc_groupUpdateTask],

    /************************{Battle-tasks}*************************/
    ["handleBattleTask",             SQFM_fnc_groupHandleBattleTask],
    ["canGetBattleTask",             SQFM_fnc_groupCanGetBattleTask],
    ["initBattleTask",                 SQFM_fnc_groupInitBattleTask],
    ["endBattleTask",          {[(_self get "grp")] call SQFM_fnc_groupEndBattleTask}],
    ["getHostileBattleGroups", SQFM_fnc_groupGetHostileBattleGroups],
    ["getBattleStatus",               SQFM_fnc_groupGetBattleStatus],
    ["battleAbortObjective", SQFM_fnc_groupBattleAbortObjectiveTask],

	/************************{Artillery}*************************/
	["artilleryAvailable",                 SQFM_fnc_groupArtilleryAvailable],
    ["artilleryFireMission",             SQFM_fnc_groupArtilleryFireMission],
	["artilleryPieces",                       SQFM_fnc_groupArtilleryPieces],
    ["isWaitingForArtillery",             SQFM_fnc_groupArtilleryHasRequest],
    ["artilleryOnDelay",                     SQFM_fnc_groupArtilleryOnDelay],
    ["artilleryCanFireAtPos",           SQFM_fnc_groupArtilleryCanFireAtPos],
    ["canRequestArtillery",               SQFM_fnc_groupArtilleryCanRequest],
    ["requestArtillery",                     SQFM_fnc_groupArtilleryRequest],
    ["artilleryStrikePositions", SQFM_fnc_groupArtilleryValidStrikePositions],
    ["radioRequestArtillery",           SQFM_fnc_groupArtilleryRequestRadio],
    ["artilleryTimeSinceRequest",   SQFM_fnc_groupArtilleryTimeSinceRequest],
    ["getArtySquads",                      SQFM_fnc_groupArtilleryGetSquads],
    ["battleCallArty",                         SQFM_fnc_groupBattleCallArty],

    /**********************{TACTICS}***************************/
    ["garrison",                                   SQFM_fnc_groupGarrison],
    ["getNearUrbanZones",                 SQFM_fnc_groupGetNearUrbanZones],
    ["getInBuilding",                         SQFM_fnc_groupGetInBuilding],
    ["timeSinceRegroup",               {time - (_self get "lastRegroup")}],
    ["canRegroup",                               SQFM_fnc_groupCanRegroup],
    ["regroup",                                     SQFM_fnc_groupRegroup],
    ["disableAttack",                         SQFM_fnc_groupDisableAttack],
    ["enableAttack",                           SQFM_fnc_groupEnableAttack],

    /************************{Idle-state}***************************/
    ["idleGarrison",                           SQFM_fnc_groupIdleGarrison],
    ["initIdleState",                         SQFM_fnc_groupInitIdleState],
    ["initIdleGarrison",                   SQFM_fnc_groupInitIdleGarrison],
    ["canIdleGarrison",                     SQFM_fnc_groupCanIdleGarrison],
    ["setIdleState",                           SQFM_fnc_groupSetIdleState],
    ["setLastActionTime",                 SQFM_fnc_groupSetLastActionTime],
    ["getIdleCoverArea",                   SQFM_fnc_groupGetIdleCoverArea],
    ["idleCover",                   {_self spawn SQFM_fnc_groupIdleCover}],
    ["debugIdleText",                         SQFM_fnc_groupDebugIdleText],
    // ["InitMechClearingFormation", SQFM_fnc_groupInitMechClearingFormation],

    /********************{GROUP MEMBERS}************************/
    ["getUnits",                                    SQFM_fnc_getGroupUnits],
    ["getUnitsOnfoot",                        SQFM_fnc_getGroupUnitsOnFoot],
    ["getVehiclesInUse",               {(_self call ["getOwnVehicles"])#2}],
    // ["getUnarmedVehicles",                SQFM_fnc_groupGetUnarmedVehicles],
    ["isVehicleGroup",       {count(_self call ["nonCrewMen"])isEqualTo 0}],
    ["isPlayerGroup",        {[_self get"grp"]call SQFM_fnc_isPlayerGroup}],
    ["isInfantryGroup",                      SQFM_fnc_groupIsInfantryGroup],
    ["isMechanized",                            SQFM_fnc_groupIsMechanized],
    ["getGrpMembers",                               SQFM_fnc_getGrpMembers],
    ["anyValidMan",{[_self get "grp"] call SQFM_fnc_firstValidGroupMember}],
    ["getStrength",                              SQFM_fnc_getGroupStrength],
    ["strengthCoef",                            SQFM_fnc_groupStrengthCoef],
    ["setStrengthIcon",                      SQFM_fnc_groupSetStrengthIcon],
	["crewMen",                                         SQFM_fnc_groupCrew],
	["nonCrewMen",                                   SQFM_fnc_groupNonCrew],
    ["getFipoMen",                                SQFM_fnc_groupGetFipoMen],
    ["tallyAssets",                              SQFM_fnc_groupTallyAssets],
    ["getGroupCluster",                           SQFM_fnc_getGroupCluster],
    ["setGroupCluster",                           SQFM_fnc_setGroupCluster],
    ["getAvgPos",                                     SQFM_fnc_groupAvgPos],
    ["getRadius",                                  SQFM_fnc_groupGetRadius],
    ["getStrSide",                                SQFM_fnc_groupGetStrSide],
    ["isPlayerGroup",       {[_self get"grp"] call SQFM_fnc_isPlayerGroup}],
    ["mergeWithGroup",                        SQFM_fnc_groupMergeWithGroup],
    ["unStop",                                        SQFM_fnc_groupUnstop],
    ["getFunctionalMen",                    SQFM_fnc_groupGetFunctionalMen],


    /**********************{REPLENISH}************************/
    ["canReplenish",                            SQFM_fnc_groupCanReplenish],
    ["canBeReplenished",                    SQFM_fnc_groupCanBeReplenished],
    ["canReplenishGroup",                  SQFM_fnc_groupCanReplenishGroup],
    ["canCombatReplenish",                SQFM_fnc_groupCanCombatReplenish],
    ["needsCombatReplenish",            SQFM_fnc_groupNeedsCombatReplenish],
    ["combatReplenish",                      SQFM_fnc_groupCombatReplenish],
    ["replenishGroup",                        SQFM_fnc_groupReplenishGroup],
    ["replenishDirect",                 SQFM_fnc_groupReplenishGroupDirect],    
    

	/**********************{GROUP CLASS}************************/
	["isUnarmedMotorized",              SQFM_fnc_groupIsUnarmedMotorized],
	["isInfantrySquad",                    SQFM_fnc_groupIsInfantrySquad],
	["getGroupType",                                  SQFM_fnc_groupType],
	["setGroupType", {_self set["groupType",_self call["getGroupType"]]}],

    /**********************{COMBAT}****************************/
    ["battleInit",                     SQFM_fnc_groupBattleInit],
    ["battleEnd",                       SQFM_fnc_groupBattleEnd],
    ["addShot",                          SQFM_fnc_addGroupShots],
    ["getBattle",  {SQFM_battles get (_self get "battlefield")}],
    ["inBattle",                         SQFM_fnc_groupInBattle],
    ["canInitBattle",               SQFM_fnc_groupCanInitBattle],
    ["sinceBattle",           SQFM_fnc_timeSinceLastGroupBattle],
    ["isNotSuppressing",           SQFM_fnc_grpIsNotSuppressing],
    ["returnFire",                     SQFM_fnc_groupReturnFire],
    ["endReturnFire",   {_self spawn SQFM_fnc_endGrpReturnFire}],

    ["nearEnemyGrp",                 SQFM_fnc_groupNearEnemyGrp],
    ["nearKnownEnemies",         SQFM_fnc_groupNearKnownEnemies],
    ["attackGroup",                   SQFM_fnc_groupAttackGroup],
    ["updateBattleStrength", SQFM_fnc_groupUpdateBattleStrength],
    ["combatZone",                     SQFM_fnc_groupCombatZone],
    ["revealTargets",               SQFM_fnc_groupRevealTargets],
    ["revealAndTarget",           SQFM_fnc_groupRevealAndTarget],

    /**********************{Hunting}***************************/
    ["initHunt",                         SQFM_fnc_groupInitHunt],
    ["initHuntTask",                 SQFM_fnc_groupInitHuntTask],
    ["ableToHunt",                     SQFM_fnc_groupAbleToHunt],

	/**********************{AT-support}*************************/
    ["initAtSupport",            SQFM_fnc_groupInitAtSupportTask],
	["atSupportInsertPos",   SQFM_fnc_groupAtSupportInsertionPos],
	["onAtInsertion",                SQFM_fnc_groupOnAtInsertion],
	["endAtSupport",                  SQFM_fnc_groupEndAtSupport],
    ["initAtTarget",                  SQFM_fnc_groupInitAtTarget],
    ["deInitAtTarget",              SQFM_fnc_groupDeInitAtTarget],
    ["initAtSupportTravel",    SQFM_fnc_groupInitAtSupportTravel],
    ["atSupportDirectMove",    SQFM_fnc_groupAtSupportDirectMove],
    ["atSupportUpdate",            SQFM_fnc_groupAtSupportUpdate],
    ["canAtReveal",                    SQFM_fnc_groupCanAtReveal],
    ["targetVisible",                SQFM_fnc_groupTargetVisible],
    ["infMoveOnAtTarget",        SQFM_fnc_groupInfMoveOnAtTarget],
    ["infEngageAtTarget",        SQFM_fnc_groupInfEngageAtTarget],
    ["attackArmorOnSight",      SQFM_fnc_groupAttackArmorOnSight],
    ["getAtMen",                          SQFM_fnc_groupGetAtMen],
    ["isATsquad",                            SQFM_fnc_groupHasAT],

    ["callAtSupport",                SQFM_fnc_groupCallAtSupport],
    ["canCallAtSupport",          SQFM_fnc_groupCanCallAtSupport],
    ["sendAtSupportRequest",  SQFM_fnc_groupSendAtSupportRequest],
	
    /**********************{DEFENSE}***************************/
    ["assignFipos",                       SQFM_fnc_groupAssignFipos],
    ["leaveFipos",                         SQFM_fnc_groupLeaveFipos],
	["assignObjectiveFipos",     SQFM_fnc_groupAssignObjectiveFipos],
	["assignObjectiveTurrets", SQFM_fnc_groupAssignObjectiveTurrets]
];

{
    private _name = _x#0;
    private _code = _x#1;
    _groupData set [_name, _code];
    
} forEach _methods;

true;