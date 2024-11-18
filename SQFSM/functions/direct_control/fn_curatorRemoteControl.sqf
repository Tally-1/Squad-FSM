params[
	["_entity",nil,[objNull]]
];

private _alreadyActive = !isNull (missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit",objNull]);
if(_alreadyActive)exitWith{};

private _unit      = effectiveCommander _entity;
private _tempOwner = _unit getVariable ["bis_fnc_moduleRemoteControl_owner", objNull];
private _error     = "";

if !(side group _unit in [east,west,resistance,civilian]) then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorEmpty";};
if (isPlayer _unit) then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorPlayer";};
if !(alive _unit)   then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorDestroyed";};
if (isNull _unit)   then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorNull";};
if (!isNull _tempOwner && {_tempOwner in allPlayers}) then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorControl";};
if (isUAVConnected vehicle _unit) then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorControl";};

if (_error != "")exitWith{[objNull,_error] call bis_fnc_showCuratorFeedbackMessage};

_unit spawn {
	scriptName "bis_fnc_moduleRemoteControl: Loop";
	_unit = _this;
	_vehicle = vehicle _unit;
	_vehicleRole = str assignedVehicleRole _unit;

	bis_fnc_moduleRemoteControl_unit = _unit;
	_unit setVariable ["bis_fnc_moduleRemoteControl_owner",player,true];


	if (ace_zeus_remoteWind) then {

	[format ["wind%1",ceil random 5],"bis_fnc_playsound"] call bis_fnc_mp;
	};

	_blur = ppEffectCreate ["RadialBlur",144];
	_blur ppEffectEnable true;
	_blur ppEffectAdjust [0,0,0.3,0.3];
	_blur ppEffectCommit 0;
	_blur ppEffectAdjust [0.03,0.03,0.1,0.1];
	_blur ppEffectCommit 1;

	_cam = "camera" camCreate getPosATL curatorCamera;
	_cam cameraEffect ["internal","back"];
	_cam camPrepareTarget (screenToWorld [0.5,0.5]);
	_cam camCommitPrepared 0;
	_cam camPrepareTarget _unit;
	_cam camPrepareFov 0.1;
	_cam camCommitPrepared 1;
	sleep 0.75;

	("bis_fnc_moduleRemoteCurator" call bis_fnc_rscLayer) cutText ["","black out",0.25];
	sleep 0.25;


	(findDisplay 312) closeDisplay 2;
	waitUntil {isNull curatorCamera};


	player remoteControl _unit;
	if (cameraOn != _vehicle) then {
	_vehicle switchCamera cameraView;
	};

	ppEffectDestroy _blur;
	_cam cameraEffect ["terminate","back"];
	camDestroy _cam;

	_color = ppEffectCreate ["colorCorrections",1896];
	_color ppEffectEnable true;
	_color ppEffectAdjust [1,1,0,[0,0,0,1],[1,1,1,1],[0,0,0,0],[0.9,0.0,0,0,0,0.5,1]];
	_color ppEffectCommit 0;

	_curator = getAssignedCuratorLogic player;
	[_curator,"curatorObjectRemoteControlled",[_curator,player,_unit,true]] call bis_fnc_callScriptedEventHandler;
	[["Curator","RemoteControl"],nil,nil,nil,nil,nil,nil,true] call bis_fnc_advHint;

	sleep 0.3;
	_color ppEffectAdjust [1,1,0,[0,0,0,1],[1,1,1,1],[0,0,0,0],[0.9,0.85,0,0,0,0.5,1]];
	_color ppEffectCommit 0.3;
	("bis_fnc_moduleRemoteCurator" call bis_fnc_rscLayer) cutText ["","black in",0.5];


	_vehicle = vehicle _unit;
	_vehicleRole = str assignedVehicleRole _unit;
	_rating = rating player;
	waitUntil {

	if ((vehicle _unit != _vehicle || str assignedVehicleRole _unit != _vehicleRole) && {alive _unit}) then {
	player remoteControl _unit;
	_vehicle = vehicle _unit;
	_vehicleRole = str assignedVehicleRole _unit;
	};
	if (rating player < _rating) then {
	player addRating (-rating player + _rating);
	};
	sleep 0.01;
	!isNull curatorCamera
	||
	{cameraOn == vehicle player}
	||
	{!alive _unit} 
	||
	{!alive player}
	||
	{isNull getAssignedCuratorLogic player}
	};

	player addRating (-rating player + _rating);
	objNull remoteControl _unit;
	_unit setVariable ["bis_fnc_moduleRemoteControl_owner",nil,true];

	if (alive player) then {

	if (
	isNull curatorCamera
	&&
	{cameraOn != vehicle player}
	&&
	{!isNull _unit}
	&&
	{!isNull getAssignedCuratorLogic player}


	) then {
	sleep 2;
	("bis_fnc_moduleRemoteCurator" call bis_fnc_rscLayer) cutText ["","black out",1];
	sleep 1;
	};
	if !(isNull _unit) then {
	_unitPos = getPosATL _unit;
	_camPos = [_unitPos,10,direction _unit + 180] call bis_fnc_relpos;
	_camPos set [2,(_unitPos select 2) + (getTerrainHeightASL _unitPos) - (getTerrainHeightASL _camPos) + 10];

	(getAssignedCuratorLogic player) setVariable ["bis_fnc_modulecuratorsetcamera_params",[_camPos,_unit]];
	};

	sleep 0.1; 
	("bis_fnc_moduleRemoteCurator" call bis_fnc_rscLayer) cutText ["","black in",1e10];
	openCuratorInterface;
	ppEffectDestroy _color;

	waitUntil {!isNull curatorCamera};
	} 
	else {ppEffectDestroy _color};
	
	player switchCamera cameraView;
	bis_fnc_moduleRemoteControl_unit = nil;
	("bis_fnc_moduleRemoteCurator" call bis_fnc_rscLayer) cutText ["","black in",1];
	[_curator,"curatorObjectRemoteControlled",[_curator,player,_unit,false]] call bis_fnc_callScriptedEventHandler;
	sleep 0.01;
};