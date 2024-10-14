if(isNil "SQFM_debugMode")then{ 
	SQFSM_Version           = 0.2;
	SQFM_debugMode          = true; // Debug-mode active 
	SQFM_boardTeleportDist  = 30;   // How far away a group of men can be in order to teleport into a vehicle.
	SQFM_manualBoardingDist = 100; 
	SQFM_travelWalkDist     = 500;
};


missionNamespace setVariable ["SQFM_debugMode",                 SQFM_debugMode,             true];
missionNamespace setVariable ["SQFM_boardTeleportDist",         SQFM_boardTeleportDist,     true];
missionNamespace setVariable ["SQFM_manualBoardingDist",        SQFM_manualBoardingDist,    true];
missionNamespace setVariable ["SQFM_idleStateTimeLimitSeconds", SQFM_idleStateTimeLimit*60, true];
missionNamespace setVariable ["SQFM_travelWalkDist",            SQFM_travelWalkDist,        true];
missionNamespace setVariable ["SQFSM_Version",                  SQFSM_Version,              true];


/*****************/
true;