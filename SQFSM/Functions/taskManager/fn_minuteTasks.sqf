call SQFM_fnc_sendHuntGroups;
call SQFM_fnc_assignAllGroupTasks;
call SQFM_fnc_handleNewGroups;
call SQFM_fnc_handleDeadGroups;
call SQFM_fnc_updateAllGroups;
[] spawn {
	sleep round random 20;
 	[(call SQFM_fnc_getCategorizedGroups)] call SQFM_fnc_assignAllReinforcements;
	sleep round random 20;
	[(call SQFM_fnc_getCategorizedGroups)] call SQFM_fnc_assignAllReinforcements;
}