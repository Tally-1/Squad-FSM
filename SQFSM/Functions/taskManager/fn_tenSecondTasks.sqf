call SQFM_fnc_updateAllObjectives;
[] spawn SQFM_fnc_artilleryHandleAllRequests;
[] spawn SQFM_fnc_updateActiveArtyRequests;
[]spawn{
	[(call SQFM_fnc_getCategorizedGroups)] call SQFM_fnc_assignAllReinforcements;
	// "reinforcements handled"
};
