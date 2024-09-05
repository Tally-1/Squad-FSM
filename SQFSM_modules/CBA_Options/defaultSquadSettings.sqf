_versionName = "DCO Squad FSM | Default Squad Behaviour";

[
	"SQFM_defaultBehaviourExcluded",
	"CHECKBOX",
	["Exclude from SQFSM", "If checked all new squads will be excluded from Squad FSM. \n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
	_versionName,
	false
] call CBA_fnc_addSetting;


[
	"SQFM_defaultBehaviourAttack",
	"CHECKBOX",
	["Capture Objectives", "Enables all new squads to attack objectives.\n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
	_versionName,
	true
] call CBA_fnc_addSetting;

[
	"SQFM_defaultBehaviourDefend",
	"CHECKBOX",
	["Defend Objectives", "Enables all new squads to defend objectives.\n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
	_versionName,
	true
] call CBA_fnc_addSetting;


[
	"SQFM_defaultBehaviourReinforce",
	"CHECKBOX",
	["Can Reinforce", "Enables all new squads to reinforce friendlies when called.\n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
	_versionName,
	true
] call CBA_fnc_addSetting;


[
	"SQFM_defaultBehaviourCallReforce",
	"CHECKBOX",
	["Can call reinforcements", "Enables all new squads to call for reinforcements.\n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
	_versionName,
	true
] call CBA_fnc_addSetting;


[
	"SQFM_defaultBehaviourCallCAS",
	"CHECKBOX",
	["Can call CAS", "Enables all new squads to call for Close Air Support.\n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
	_versionName,
	true
] call CBA_fnc_addSetting;

[
	"SQFM_defaultBehaviourCallArty",
	"CHECKBOX",
	["Can call Artillery", "Enables all new squads to call for Artillery.\n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
	_versionName,
	true
] call CBA_fnc_addSetting;

[
	"SQFM_defaultBehaviourPush",
	"CHECKBOX",
	["Push Near Enemies", "Enables all new squads to push near enemies.\n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
	_versionName,
	true
] call CBA_fnc_addSetting;

private _defaultPushDistance = 200;
if(SQFM_travelWalkDist < 500)
then{_defaultPushDistance = SQFM_travelWalkDist};

[
	"SQFM_defaultBehaviourPushDist",
	"SLIDER",
	["Push Distance", "How far a squad can push near enemies.\n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
	_versionName,
	[
		100,                   //minimum 
		500,                   //max
		_defaultPushDistance,  //default
		0,	                   //decimals
		false
	],
	1
] call CBA_fnc_addSetting;

[
	"SQFM_defaultBehaviourPushKnowledge",
	"SLIDER",
	["Push Knowledge", "Knowledge needed to push near enemies.\n 0 = will push all enemies regardless of prior knowledge.\n 1 = needs full knowledge in order to initiate push.\n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
	_versionName,
	[
		0,  //minimum 
		1,  //max
		0,  //default
		1,	//decimals
		false
	],
	1
] call CBA_fnc_addSetting;