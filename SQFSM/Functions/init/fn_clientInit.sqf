call SQFM_fnc_debug3D;
[]spawn{
	while {sleep 1; true} do {
		if(SQFM_debugMode)
		then{call SQFM_fnc_toggleBattleHud};
				
	};	
};
