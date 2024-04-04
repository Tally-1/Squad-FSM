if(!isnil "SQFM_markers3D")exitWith{};
SQFM_markers3D          = true;
SQFM_Custom3Dpositions = [];

addMissionEventHandler ["Draw3D", {
if(SQFM_debugMode)
then{
		call SQFM_fnc_custom3Dmarkers;
		call SQFM_fnc_objective3D;
		call SQFM_fnc_groups3D;
		call SQFM_fnc_battle3D;
		call SQFM_fnc_transportModules3D;
		
}}];