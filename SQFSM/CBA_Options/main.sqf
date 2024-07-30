missionNamespace setVariable ["SQFSM_Version", 0.60, true];
private _versionName = ["DCO Squad FSM | ", SQFSM_Version] joinString "";

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