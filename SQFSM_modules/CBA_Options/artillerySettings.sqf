_versionName = "DCO Squad FSM | Artillery Settings";

[
	"SQFM_artySpread",
	"SLIDER",
	["Artillery Spread", "Rounds will be aimed randomly within this distance from the target. 0 = Aims on target 100 = Aims randomly within 100m for each shot"],
	_versionName,
	[
		0,     //minimum 
		300,   //max
		40,    //default
		0,	   //decimals
		false  //decimals
	],
	1
] call CBA_fnc_addSetting;

[
	"SQFM_artyRounds",
	"SLIDER",
	["Artillery Rounds", "How many rounds will be fired in one strike"],
	_versionName,
	[
		1,     //minimum 
		32,    //max
		5,     //default
		0,	   //decimals
		false  //decimals
	],
	1
] call CBA_fnc_addSetting;

[
	"SQFM_artyDelay",
	"SLIDER",
	["Artillery Delay", "How many seconds the artillery takes to get ready from accepting the request until it fires"],
	_versionName,
	[
		0,     //minimum 
		300,   //max
		10,    //default
		0,	   //decimals
		false  //decimals
	],
	1
] call CBA_fnc_addSetting;


[
	"SQFM_artyCooldown",
	"SLIDER",
	["Artillery Gun CoolDown", "How many seconds from when a artillery piece has fired until it can accept a new fire mission."],
	_versionName,
	[
		0,     //minimum 
		300,   //max
		60,    //default
		0,	   //decimals
		false  //decimals
	],
	1
] call CBA_fnc_addSetting;

[
	"SQFM_artyCallCooldown",
	"SLIDER",
	["Artillery Call CoolDown", "Cooldown in seconds between each time a squad can call in a Artillery Request."],
	_versionName,
	[
		10,    //minimum 
		600,   //max
		60,    //default
		0,	   //decimals
		false  //decimals
	],
	1
] call CBA_fnc_addSetting;


[
	"SQFM_artyCallCooldownBattle",
	"SLIDER",
	["Artillery Battle Call CoolDown", "Cooldown for each side in a battle. (Does not affect Recon Squads)"],
	_versionName,
	[
		10,    //minimum 
		1200,  //max
		300,   //default
		0,	   //decimals
		false  //decimals
	],
	1
] call CBA_fnc_addSetting;

[
	"SQFM_artySafeDist",
	"SLIDER",
	["Artillery Safe distance", "Artillery will not be called when friendlies are within this distance of the target. Meaning (spread)+(safeDist). If spread is 50m and safedist is 10 then no friendlies can be within 60 meters"],
	_versionName,
	[
		0,     //minimum 
		100,   //max
		10,    //default
		0,	   //decimals
		false  //decimals
	],
	1
] call CBA_fnc_addSetting;


[
	"SQFM_showArtyChat",
	"CHECKBOX",
	["Show artillery Chat", "Show Side-chat for Artillery Calls."],
	_versionName,
	true
] call CBA_fnc_addSetting;
