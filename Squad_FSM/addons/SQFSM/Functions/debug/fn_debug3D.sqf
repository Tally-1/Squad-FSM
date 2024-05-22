if(!isnil "SQFM_markers3D")exitWith{};
SQFM_markers3D         = true;
SQFM_Custom3Dpositions = [];
SQFM_maxObjRange       = 100 + selectMax 
(entities "SQFSM_Objective" apply {
	private _area = [_x]call SQFM_fnc_module3dData get "area";
	(selectMax [_area#1, _area#2]);
});

addMissionEventHandler ["Draw3D", {
if(SQFM_debugMode)
then{
		call SQFM_fnc_custom3Dmarkers;
		call SQFM_fnc_objective3D;
		call SQFM_fnc_groups3D;
		call SQFM_fnc_battle3D;
		call SQFM_fnc_transportModules3D;
		
}}];