if(!isnil "SQFM_markers3D")exitWith{};
private _objectives = entities "SQFSM_Objective";

if(_objectives isEqualTo [])
then{SQFM_maxObjRange = 100}
else{
	SQFM_maxObjRange = 100 + selectMax 
	(_objectives apply {
		private _area = [_x]call SQFM_fnc_module3dData get "area";
		(selectMax [_area#1, _area#2]);
	});
};

SQFM_curatorOn         = false;
SQFM_markers3D         = true;
SQFM_Custom3Dpositions = [];

addMissionEventHandler ["Draw3D", { 
private _curatorOn = !isNull (findDisplay 312);
if(SQFM_curatorOn isEqualTo false
&&{_curatorOn})
then{call SQFM_fnc_onCuratorOpened};

SQFM_curatorOn = _curatorOn;
camPos         = (positionCameraToWorld [0,0,0]);

if(SQFM_debugMode)
then{
		call SQFM_fnc_custom3Dmarkers;
		call SQFM_fnc_objective3D;
		call SQFM_fnc_groups3D;
		call SQFM_fnc_battle3D;
		call SQFM_fnc_transportModules3D;
		call SQFM_fnc_reforceModules3D;
		
}}];