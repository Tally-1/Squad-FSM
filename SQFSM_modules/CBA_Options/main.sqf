missionNamespace setVariable ["SQFSM_Version", 0.73, true];
private _versionName = ["DCO Squad FSM | ", SQFSM_Version] joinString "";

#include "DIK_Codes.cpp"
#include "keybinds.sqf"

[
	"SQFM_debugMode",
	"CHECKBOX",
	["Debug Mode", "Show debug messages and 3D indicators ingame."],
	_versionName,
	false
] call CBA_fnc_addSetting;

[
	"SQFM_boardTeleportDist",
	"SLIDER",
	["Boarding Teleport Distance", "How far away a group of men can be in order to teleport into a vehicle."],
	_versionName,
	[
		10,   	//minimum 
		70,     //max
		30,    //default
		0,	   //decimals
		false
	],
	1
] call CBA_fnc_addSetting;

[
	"SQFM_manualBoardingDist",
	"SLIDER",
	["Manual Boarding Distance", "How far away a group of men can be in order to board a vehicle."],
	_versionName,
	[
		50,   	//minimum 
		200,    //max
		100,    //default
		0,	   //decimals
		false
	],
	1
] call CBA_fnc_addSetting;


[
	"SQFM_travelWalkDist",
	"SLIDER",
	["Travel on foot distance", "How far an infantry squad can walk on foot without calling for transport."],
	_versionName,
	[
		200,   	   // minimum 
		worldSize, // max
		500,       // default
		0,	       // decimals
		false
	],
	1
] call CBA_fnc_addSetting;



[
	"SQFM_replenishDistance",
	"SLIDER",
	["Replenish Distance", "How far one infantry squad may replenish another."],
	_versionName,
	[
		50,   // minimum 
		500,  // max
		250,  // default
		0,	  // decimals
		false 
	],
	1
] call CBA_fnc_addSetting;


[
	"SQFM_allowRegroup",
	"CHECKBOX",
	["Allow Regrouping", "Enable squads to regroup if they are spread out."],
	_versionName,
	true
] call CBA_fnc_addSetting;


[
	"SQFM_regroupDistance",
	"SLIDER",
	["Regroup Distance", "If a squad is spread out further than this it will attempt to regroup, aborting other actions."],
	_versionName,
	[
		50,   // minimum 
		300,  // max
		100,  // default
		0,	  // decimals
		false 
	],
	1
] call CBA_fnc_addSetting;


[
	"SQFM_regroupInterval",
	"SLIDER",
	["Regroup Interval", "How often a squad will check if it needs to regroup(seconds)."],
	_versionName,
	[
		30,      // minimum 
		1200,   // max
		180,   // default
		0,	  // decimals
		false 
	],
	1
] call CBA_fnc_addSetting;


[
	"SQFM_showReforChat",
	"CHECKBOX",
	["Show reinforcement Chat", "Show side chat messages related to reinforcements."],
	_versionName,
	true
] call CBA_fnc_addSetting;


[
	"SQFM_idleStateTimeLimit",
	"SLIDER",
	["Idle Timer", "How many minutes of inactivity until squads become idle."],
	_versionName,
	[
		1,  //minimum 
		30,  //max
		5,  //default
		0,	//decimals
		false
	],
	1
] call CBA_fnc_addSetting;

[
	"SQFM_showSquadMapMarkers",
	"CHECKBOX",
	["Squad Markers", "Show Squad markers on map."],
	_versionName,
	true
] call CBA_fnc_addSetting;


[
	"SQFM_showHostileSquadMapMarkers",
	"LIST",
	["Show Enemy Squad-markers", "Show hostile Squads on map."],
	_versionName,
	[
		["always", "never", "known_group", "known_side"],
		["Always", "Never", "Only Squads known to Player GROUP", "Only Squads known to Player SIDE"], 
		0
	]
] call CBA_fnc_addSetting;


[
	"SQFM_battlePublicVar",
	"CHECKBOX",
	["Battlefield Public Broadcast", "The publicVariable command will be used to broadcast battlefield data (disable if you have low bandwith). The most precise is to leave it on, but it may cause dedicated servers to lag."],
	_versionName,
	true
] call CBA_fnc_addSetting;


[
	"SQFM_shareBattleKnowledge",
	"CHECKBOX",
	["Share Battle Knowledge", "Allow squads to gain intel on enemies during a battle from what their side knows."],
	_versionName,
	false
] call CBA_fnc_addSetting;

#include "defaultSquadSettings.sqf"
