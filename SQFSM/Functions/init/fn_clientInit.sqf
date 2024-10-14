SQFM_terminatedCams = [];
call SQFM_fnc_debug3D;
call SQFM_fnc_validModlist;
[]spawn SQFM_fnc_initMapDrawLoop;
[]spawn{
	while {sleep 1; true} do {
		if(SQFM_debugMode)
		then{
			call SQFM_fnc_toggleBattleHud;
			call SQFM_fnc_updateDebugHud;
		};
		call SQFM_fnc_killCameras;
		SQFM_clickDc = false;
	};	
};

if(SQFM_debugMode)
then{[] spawn SQFM_fnc_initDebugHUD};