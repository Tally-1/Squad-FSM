call SQFM_fnc_updateAllObjectives;
[]spawn{
	[(call SQFM_fnc_getCategorizedGroups)] call SQFM_fnc_assignAllReinforcements;
	// "reinforcements handled"
};
