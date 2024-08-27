params [
	["_group", nil, [grpNull]]
];

private _data      = _group getVariable "SQFM_grpData";
private _taskData  = _data call ["getTaskData"];
private _taskName  = _taskData get "name";
private _objective = _data get "objective";
private _icon      = "\A3\ui_f\data\map\groupicons\selector_selectedFriendly_ca.paa";
private _mechMode  = _data get "mechClearing";

if(_mechMode)exitWith{"\A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa"};

if(!isNull _objective)then{_icon = "\A3\ui_f\data\map\markers\military\circle_CA.paa";};

if(isNil "_taskName")exitWith{_icon};

if(_taskName isEqualTo "transport")exitWith{
	private _state = _taskData get "state";
	if("Picking up"   in _state) exitWith{"\A3\ui_f\data\map\markers\military\pickup_CA.paa"};
	if("Dropping off" in _state) exitWith{"\A3\Ui_f\data\Map\Markers\Military\ambush_ca.paa"};
	if("Unloading"    in _state) exitWith{"\A3\ui_f\data\map\markers\military\start_CA.paa"};
	if("Returning"    in _state) exitWith{"\A3\ui_f\data\map\markers\military\end_CA.paa"};
};


_icon;