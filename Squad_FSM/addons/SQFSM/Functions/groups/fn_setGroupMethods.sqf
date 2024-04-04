params[
    ["_groupData",nil,[createHashmap]]
];

private _methods = [    
    ["3DIcon",                             SQFM_fnc_group3DIcon],
    ["3DColor",                           SQFM_fnc_group3DColor],
    ["setMethods",      {[_self] call SQFM_fnc_setGroupMethods}],

    /*************************{MISC}***************************/
    ["isIdle",                             SQFM_fnc_groupIsIdle],
    ["isValid", {[(_self get "grp")] call SQFM_fnc_validGroup;}],
    ["activeWp",                              SQFM_fnc_activeWp],
    
    /**********************{TRAVEL}*****************************/
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

                      /*{transport}*/
    ["canCallTransport",           SQFM_fnc_groupCanCallTransport],
    ["callTransport",                 SQFM_fnc_groupCallTransport],
    ["getTransportSpawner",     SQFM_fnc_groupGetTransportSpawner],
    ["sinceTransportCall", {time-(_self get "lastTransportCall")}],

                      /*{boarding}*/
    ["canSelfTransport",         SQFM_fnc_groupCanSelfTransport],
    ["enoughTransportNear",   SQFM_fnc_enoughGroupTransportNear],
    ["canBoardNow",                   SQFM_fnc_groupcanBoardNow],
    ["boardingStatus",             SQFM_fnc_groupBoardingStatus],
    ["isBoarded",  {_self call ["boardingStatus"] == "boarded"}],
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

	/********************{OBJECTIVES}***************************/
	["validObjective",            SQFM_fnc_group_validObjective],
    ["objectiveInRange",         SQFM_fnc_groupObjectiveInRange],
    ["getNearObjectives",       SQFM_fnc_groupGetNearObjectives],
    ["assignObjective",           SQFM_fnc_groupAssignObjective],
    ["autoAssignObjective",   SQFM_fnc_groupAutoAssignObjective],
    ["takeObjective",               SQFM_fnc_groupTakeObjective],
    ["onObjectiveArrival",     SQFM_fnc_groupOnObjectiveArrival],
    ["guardObjective",             SQFM_fnc_groupGuardObjective],
    ["objectiveData",               SQFM_fnc_groupObjectiveData],

    /************************{TASKS}****************************/
    ["initTask",                          SQFM_fnc_initTaskData],
    ["initObjectiveTask",       SQFM_fnc_groupInitObjectiveTask],

    /**********************{TACTICS}***************************/
    ["garrison",                         SQFM_fnc_groupGarrison],

    /********************{GROUP MEMBERS}************************/
    ["getUnits",                              SQFM_fnc_getGroupUnits],
    ["getUnitsOnfoot",                  SQFM_fnc_getGroupUnitsOnFoot],
    ["getVehiclesInUse",         {(_self call ["getOwnVehicles"])#2}],
    ["getGrpMembers",                         SQFM_fnc_getGrpMembers],
	["crewMen",                                   SQFM_fnc_groupCrew],
	["nonCrewMen",                             SQFM_fnc_groupNonCrew],
    ["tallyAssets",                        SQFM_fnc_groupTallyAssets],
    ["getGroupCluster",                     SQFM_fnc_getGroupCluster],
    ["setGroupCluster",                     SQFM_fnc_setGroupCluster],
    ["getAvgPos",                               SQFM_fnc_groupAvgPos],
    ["getStrSide",                          SQFM_fnc_groupGetStrSide],
    ["isPlayerGroup", {[_self get"grp"] call SQFM_fnc_isPlayerGroup}],

	/**********************{GROUP CLASS}************************/
	["isUnarmedMotorized",     SQFM_fnc_groupIsUnarmedMotorized],
	["isInfantrySquad",           SQFM_fnc_groupIsInfantrySquad],
	["getGroupType",                         SQFM_fnc_groupType],
	["setGroupType",{_self set["groupType",_self call["getGroupType"]]}],

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
    ["endReturnFire",   {_self spawn SQFM_fnc_endGrpReturnFire}]
];

{
    private _name = _x#0;
    private _code = _x#1;
    _groupData set [_name, _code];
    
} forEach _methods;

true;