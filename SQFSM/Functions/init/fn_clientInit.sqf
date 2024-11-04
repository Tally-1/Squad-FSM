private _initialized = missionNamespace getVariable["SQFSM_serverReady", false];
if((!_initialized)
&&{!isServer})then{
	waitUntil {missionNamespace getVariable["SQFSM_serverReady", false]};
};

SQFM_terminatedCams = [];
call SQFM_fnc_debug3D;
call SQFM_fnc_validModlist;

[]spawn SQFM_fnc_initMapDrawLoop;
[]spawn SQFM_fnc_playerAbortTransportKeyEh;

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

addMissionEventHandler [
  "CommandModeChanged", 
  {SQFM_highCommandOn = (_this#0)}
];

localNamespace setVariable["SQFSM_clientReady", true];