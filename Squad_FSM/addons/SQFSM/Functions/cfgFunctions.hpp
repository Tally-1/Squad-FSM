class CfgFunctions
{
	class SQFM
	{
		
		class battlefield
		{
			file = "\SQFSM\Functions\battlefield";
			class initBattle                    {};
			class initBattleMap                 {};
			class initBattleBuildings           {};
			class updateBattleBuildings         {};
			class getUrbanZones                 {};
			class postInitBattle                {};
			class updateBattle                  {};
			class handleNewBattleGroups         {};
			class handleInvalidBattleGroups     {};
			class battlefieldRadius             {};
			class battlefieldDimensions         {};
			class battlefieldCenter             {};
			class getBattleGrid                 {};

			class posInBattleZone               {};
			class nearestBattlePosRad           {};
			class distanceToNearestBattle       {};
			class initBattleGroups              {};
			class endBattleGroups               {};
			class onBattleFirstShot             {};
			class timeSinceLastBattleShot       {};
			
			class endBattle                     {};
			class battleReinforcements          {};
			class battleReinforceSide           {};
			class battleSideNeedsReinforcements {};
			// class battleSideNeedsReinforcements {};

		};

		class building
		{
			file = "\SQFSM\Functions\building";
			class isHouse            {};
			class nearBuildings      {};
		};

		class clusters
		{
			file = "\SQFSM\Functions\clusters";
			class clusterRadius           {};
			class objArrData              {};
			class hashifyClusterData      {};
			class cluster                 {};
			class setClusterGrid          {};
			class clustersFromObjArr      {};

		};
		
		class debug
		{
			file =    "\SQFSM\Functions\debug";
			// class clientLoop             {};
			class debugMessage              {};
			class sendDbgMsg                {};
			class debug3D                   {};
			class custom3Dmarkers           {};

			class objective3D               {};
			class drawObjectiveModule       {};
			class setModuleLineColor        {};
			class sideColor                 {};

			class battle3D                  {};
			class drawBattle                {};
			class drawBuilding              {};
			class draw3dMarker              {};
			class multi3dMarkers            {};
			class transportModules3D        {};
			class drawTransportModule       {};
			class drawTransportModuleNoInit {};

		};

		class misc
		{
			file = "\SQFSM\Functions\misc";
			class copyHashmap            {};
			class sideToStrSide          {};
			class removeNull             {};
			class getData                {};
			class sidesFromGroupArr      {};
			class getTextTexture         {};
			class enemiesInZone          {};
			class getLocationNamePos     {};
			class closestLocationName    {};
			class areaName               {};
			class validEnum              {};
			class delayedBaseSideChat    {};
			class zoneStrengthBySide     {};
			class posIsHostile           {};

		};

		class math
		{
			file = "\SQFSM\Functions\math";
			class module3dData           {};
			class getModuleArea          {};
			class getAreaCorners         {};
			class areaCornerLines        {};
			class sinCosPos              {};
			class AddZ                   {};
			class roundPos               {};
			class average                {};
			class avgPos2D               {};
			class getMidpoint            {};
			class straightPosArr         {};
			class squareGrid             {};
			class getNearest             {};
			class pos360                 {};
			class getCircleLines         {};
			class clearPos               {};
			class clearPosSqrArea        {};
			class clearPosInArea         {};
			class posHasTerrainCover     {};
			class posIsHidden            {};
			class numDiff                {};
			class decimals               {};
			class objectShape            {};
			class shapeFitsShape         {};

			class roadsInArea            {};
			class findParkingSpot        {};
			class getAreaParkingPos      {};
			class formatDir              {};
			class lineBroken             {};
			class selectSafePositions    {};
			class semiCirclePosArr       {};
			class formatDirRanges        {};
			class inDirRange             {};
			class dangerZoneSafePositions{};
			class describeDistance       {};
			class describeDir            {};

		};

		class objectiveModule
		{
			file =       "\SQFSM\Functions\objectiveModule";
			class initObjective                   {};
			class setObjectiveData                {};
			class setObjectiveMethods             {};
			class updateMethodsAllObjectives      {};
			class objectiveDescription            {};
			class assetTypesMatch                 {};
			class objectiveAssignGroup            {};
			class objectiveUnAssignGroup          {};
			class objectiveGetAssignedAssets      {};
			class objectiveNeedsTroops            {};
			class objectiveGetContested           {};
			class objectiveGetSidesInZone         {};
			class objectiveUpdate                 {};
			class updateAllObjectives             {};
			class objectiveCountAssignedAssets    {};
			class objectivesSorted                {};
			class nearestObjective                {};
			class objectiveStoreSafePosSearch     {};
			class objectiveGetStoredSafePositions {};
			class objectiveSafeposMatch           {};
			class objectiveRemoveSafePosSearches  {};
			class objectiveOnCapture              {};

		};

		class transportModule
		{
			file = "\SQFSM\Functions\transportModule";
			class initTransportSpawner    {};
			class transportVehicleData    {};
			class transportSpawnPosClear  {};
			class spawnerGetVehicleType   {};
			class transportSpawnPos       {};
			class spawnTransport          {};
			class initAllTransportModules {};
		};

		class transportTask
		{
			file = "\SQFSM\Functions\transportModule\transportTask";
			class sendTransport           {};
			class transportAvailability   {};
			class onPickupWpTransporter   {};
			class onDropOffWpTransporter  {};
			class onReturnWpTransporter   {};
			class transportPostboarding   {};
		};

		class man
		{
			file = "\SQFSM\Functions\man";
			class unconscious                 {};
			class isRealMan                   {};
			class functionalMan               {};
			class hostile                     {};
			class validEnemy                  {};
			class firstValidGroupMember       {};
			class getAssignedVehicles         {};
			class teleportIntoAssignedVehicle {};
		};

		class vehicle
		{
			file = "\SQFSM\Functions\vehicle";
			class deadCrew                 {};
			class crewSize                 {};
			class validVehicle             {};
			class isLandVehicle            {};
			class vehiclesCanTransportMen  {};
			class validEnemyVehicle        {};
			class validLandEntity          {};
			class getNearAvailVehicles     {};
			class validAvailableVehicle    {};
			class menGetInSingleVehicle    {};
			class manGetInvehicle          {};
			class menCanTeleportBoard      {};
			class sortTravelVehicleList    {};
			class menOrderGetInVehicles    {};
			class vehicleEjectDeadAndUncon {};
			class vehicleDescription       {};
			class vehicleClass             {};
			class isArmedCar               {};
			class isLightArmor             {};
			class isHeavyArmor             {};

		};

		class vehicle_crwData
		{
			file = "\SQFSM\Functions\vehicle\crwData";
			class crewData                  {};
			class cargoSeatData             {};
			class hashifySeatData           {};
			class clearSeat                 {};
			class seatStatus                {};
		};

		class groups_global
		{
			file =    "\SQFSM\Functions\groups";
			class validGroup               {};
			class initGroup                {};
			class initGroupData            {};
			class setGroupMethods          {};
			class addToDataAllGroups       {};
			class getGroupsZone            {};
			class groupsInZone             {};
			class updateMethodsAllGroups   {};
			class isPlayerGroup            {};
			class groupBehaviourSettings   {};
			class groupGetBehaviorModule   {};
			class getNearestGroup          {};
		};

		class groups_abilities
		{
			file = "\SQFSM\Functions\groups\abilities";
			class getGroupAbilities          {};
			class groupAttackOnly            {};
			class groupDefendOnly            {};
		}

		class groups_combat
		{
			file = "\SQFSM\Functions\groups\combat";
			class groupInBattle            {};
			class groupCanInitBattle       {};
			class addGroupShots            {};
			class groupBattleInit          {};
			class groupBattleEnd           {};
			class timeSinceLastGroupBattle {};
			class groupNearEnemyGrp        {};
			class groupAttackGroup         {};
			class groupCombatZone          {};
		};
		
		class groups_suppress
		{
			file = "\SQFSM\Functions\groups\suppress";
			class groupReturnFire     {};
			class grpIsNotSuppressing {};
			class endGrpReturnFire    {};
		};

		class groups_events
		{
			file = "\SQFSM\Functions\groups\events";
			class grpEvents           {};
			class onEnemyDetected     {};
			class onKnowsAboutChanged {};
			
		};

		class groups_travel
		{
			file = "\SQFSM\Functions\groups\travel";
			class validGroupVehicle         {};
			class leaveInvalidVehicles      {};
			class nearGroupVehicles         {};
			class allAvailableGroupVehicles {};
			class onArrival                 {};
			class deleteWps                 {};
			class initGroupTravel           {};
			class execGroupTravel           {};
			class groupPickupPos            {};
			class groupGetTransportSpawner  {};
			class groupCanCallTransport     {};
			class groupCallTransport        {};
			class groupIsTraveling          {};
			class groupAddWayPoint          {};
		};

		class groups_boarding
		{
			file = "\SQFSM\Functions\groups\boarding";
			class groupCanSelfTransport     {};
			class groupBoardOwnVehicles     {};
			class groupBoardAllAvailable    {};
			class enoughGroupTransportNear  {};
			class groupBoardingStatus       {};
			class groupcanBoardNow          {};
			class getGroupBoardingMen       {};
			class groupBoardingStarted      {};
			class groupBoardingEnded        {};
			class groupBoardingFailed       {};
			class groupBoardVehicles        {};
			class postGroupBoarding         {};
			class endGroupBoarding          {};
			class groupBoardThenTravel      {};
			class groupEjectFromAllVehicles {};
		};

		class groups_members
		{
			file = "\SQFSM\Functions\groups\members";
			class getGrpMembers            {};
			class getGroupUnits            {};
			class getGroupUnitsOnFoot      {};
			class getGroupCluster          {};
			class setGroupCluster          {};
			class groupAvgPos              {};
			class getGroupVehicles         {};
			class groupCrew                {};
			class groupNonCrew             {};
			class groupTallyAssets         {};
			class groupIsUnarmedMotorized  {};
			class groupIsInfantrySquad     {};
			class groupType                {};
			class groupGetStrSide          {};
			class groupSetStrengthIcon     {};
			class getGroupStrength         {};
			class groupStrengthCoef        {};
			class groupMergeWithGroup      {};

		};

		class groups_tasks
		{
			file = "\SQFSM\Functions\groups\tasks";
			class initTaskData    {};
			class endTask         {};
			class addTaskWaypoint {};
		};

		class groups_debug
		{
			file = "\SQFSM\Functions\groups\debug";
			class groups3D                {};
			class group3D                 {};
			class group3DNoData           {};
			class group3DIcon             {};
			class group3DColor            {};
			class group3DText             {};
			class units3D                 {};
			class groupDebugText          {};
			class groupDebugTextAbilities {};
		};

		class groups_objectives
		{
			file = "\SQFSM\Functions\groups\objectives";
			class group_validObjective            {};
			class groupObjectiveInRange           {};
			class groupGetNearObjectives          {};
			class groupIsInsideObjective          {};
			class groupAssignObjective            {};
			class groupUnAssignObjective          {};
			class groupOnObjectiveArrival         {};
			class groupInitObjectiveTask          {};
			class groupTakeObjective              {};
			class groupGuardObjective             {};
			class groupObjectiveData              {};
			class groupAutoAssignObjective        {};
			class groupTypeMatchObjective         {};
			class groupObjectiveHostile           {};
			class groupObjectiveInsertPosStandard {};
			class groupObjectiveInsertPosDanger   {};
			class groupObjectiveInsertPos         {};

			/*Attack*/
			class assignGroupObjectivesAllSides   {};
			class assignGroupsAndObjectives       {};
			class groupAssignAttackObjective      {};
			class groupObjectiveAttackLoop        {};
			class groupEndObjectiveAttack         {};
			class groupAttackObjective            {};
			class groupAssignDefenseObjective     {};


		};

		class groups_tactics
		{
			file = "\SQFSM\Functions\groups\tactics";
			class groupGarrison            {};

		};

		class groups_misc
		{
			file = "\SQFSM\Functions\groups\misc";
			class groupIsIdle           {};
			class groupUpdate           {};
			class activeWp              {};
			class getIdleGroups         {};
			class getCategorizedGroups  {};
			class assignAllGroupTasks   {};
			class groupSetDataDelayed   {};
		};

		class groups_reinforcement_radio
		{
			file = "\SQFSM\Functions\groups\reinforcement\radio";
			class groupCallReinforcementRadio {};
			class reinfRequestRadioResponse   {};
			class sendReinfRadioResponse      {};
		};
		
		class groups_reinforcement
		{
			file = "\SQFSM\Functions\groups\reinforcement";
			class initReinforRequestsMap      {};
			class groupAddToReinfRequests     {};
			class groupOnReinforceArrival     {};
			class groupEndReinforcing         {};
			class assignReinforcementsBySide  {};
			class assignAllReinforcements     {};
			class groupReinforceInsertPos     {};
			class groupInitReinforceTask      {};
			class groupCanCallReinforcements  {};
			class groupRequestReinforcements  {};
		};

		class reinforcements
		{
			file = "\SQFSM\Functions\reinforcements";
			class initReinforRequestsMap   {};
			class addReinfReq              {};
		};

		class init
		{
			file = "\SQFSM\Functions\init";
			class initSQFSM     {postInit = 1};
			class serverInit    {};
			class initSettings  {};
			class clientInit    {};
			class initgameState {};
		};

		class globalEvents
		{
			file = "\SQFSM\Functions\globalEvents";
			class groupSpawnedEh             {};
			class projectileCreated          {};
			class onProjectileCreated        {};
			class entityKilledEh             {};
			class ACE_MedicalEvents          {};
			class ACE_Medical_OnStatusChange {};
			class curatorEvents              {};
			class onCuratorGroupSelection    {};
			class buildingChangedEh          {};
		};

		class taskManager
		{
			file = "\SQFSM\Functions\taskManager";
			class taskManager     {};
			class tenSecondTasks  {};
			class minuteTasks     {};
			class fiveMinTasks    {};
		};

		class tasks
		{
			file = "\SQFSM\Functions\taskManager\tasks";
			class handleNewGroups  {};
			class handleDeadGroups {};
			class updateAllGroups  {};
		};
	};
};