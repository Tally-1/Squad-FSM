_versionName = "DCO Squad FSM | Default Squad Behaviour";

[
	"SQFM_defaultBehaviourExcluded",
	"CHECKBOX",
	["Exclude from SQFSM", "If checked all new squads will be excluded from Squad FSM. \n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
	_versionName,
	false
] call CBA_fnc_addSetting;


[
	"SQFM_defaultBehaviourCanIdleCover",
	"CHECKBOX",
	["Take cover when Idle", "When a squad is considered Idle it will look for good positions to take cover\n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
	_versionName,
	true
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
	"SQFM_defaultBehaviourClear",
	"CHECKBOX",
	["Clear Objectives", "Enables all new squads to sweep the objective attempting to clear out enemies.\n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
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


// [
// 	"SQFM_defaultBehaviourCallCAS",
// 	"CHECKBOX",
// 	["Can call CAS", "Enables all new squads to call for Close Air Support.\n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
// 	_versionName,
// 	true
// ] call CBA_fnc_addSetting;

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

[
	"SQFM_defaultBehaviourAllowBattleTask",
	"CHECKBOX",
	["Allow Battle Tasks", "Allow squads to Push, flank or Hold during battle (may interfere with FIPOs)"],
	_versionName,
	true
] call CBA_fnc_addSetting;

[
	"SQFM_defaultBehaviourCallTransport",
	"CHECKBOX",
	["Can call Transport", "Enables the squad to call for transport.\n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
	_versionName,
	true
] call CBA_fnc_addSetting;

[
	"SQFM_defaultBehaviourUseNearVehiclesTransport",
	"CHECKBOX",
	["Can use near vehicles", "Enables the squad to use nearby empty vehicles for transport.\n Setting will be ignored if a Squad Behaviour module is synced to the new squad"],
	_versionName,
	true
] call CBA_fnc_addSetting;

private _mainSettingName = ["DCO Squad FSM | ", SQFSM_Version]joinString"";
private _toolTip         = [
	"When vehicle transport is not available this option forces the squad to travel on foot. ",
	'\nEven if the distance is higher than the "Travel on foot distance" set in the "',_mainSettingName,'" options. ',
	"\nSetting will be ignored if a Squad Behaviour module is synced to the new squad"
]joinString"";

[
	"SQFM_defaultBehaviourForceTravelOnFoot",
	"CHECKBOX",
	["Force Travel On Foot", _toolTip],
	_versionName,
	false
] call CBA_fnc_addSetting;