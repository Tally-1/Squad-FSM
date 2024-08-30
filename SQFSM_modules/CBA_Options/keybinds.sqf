private _subCategory = "DCO Squad FSM | Direct control";

[
	[_versionName, _subCategory],
	"SQFM_end_dc",
	["End Direct Unit control", "This will end the direct control over a unit."],
	"",
	{call SQFM_fnc_endDirectControl},
	[DIK_PERIOD, [true,true,true]],
	false
] call CBA_fnc_addKeybind;

[
	[_versionName, _subCategory],
	"SQFM_click_dc",
	["Hold to Double-click", "Hold this combination of buttons down in order to souble click on a unit and remote control it"],
	{SQFM_clickDc = true;},
	{SQFM_clickDc = false;},
	[DIK_F8, [true,true,true]],
	false
] call CBA_fnc_addKeybind;