call SQFM_fnc_debug3D;
[]spawn SQFM_fnc_initMapDrawLoop;
[]spawn{
	while {sleep 1; true} do {
		if(SQFM_debugMode)
		then{call SQFM_fnc_toggleBattleHud};
		SQFM_clickDc = false;
	};	
};
