/*
    This is a modified version of the "Achilles_fnc_switchUnit_start" function.
    The original work can be found at:
    https://github.com/ArmaAchilles/Achilles/releases/tag/v1.3.1

    Usage example:
    [_man] call SQFM_fnc_switchUnit_start;

*/
// params[
//     ["_unit",nil,[objNull]]
// ];

private _error = "";
private _unit = effectiveCommander (param [0]);

systemChat str _unit;

if (!(side group _unit in [east,west,resistance,civilian])) then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorEmpty";};
if (isPlayer _unit)                                         then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorPlayer";};
if (!alive _unit)                                           then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorDestroyed";};
if (isClass (configfile >> "CfgPatches" >> "ace_medical") 
&& {_unit getVariable ["ACE_isUnconscious", false]})        then {_error = localize "STR_AMAE_ERROR_UNIT_IS_UNCONSCIOUS";};
if (isNull _unit)                                           then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorNull";};
if (isUAVConnected vehicle _unit)                           then {_error = localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorControl";};
if (unitIsUAV vehicle _unit)                                then {_error = localize "STR_AMAE_ERROR_VEHICLE_IS_A_DRONE";};
if (_error != "")                                           exitWith {
	[_error,"hint"] call dbgm;
	// [_error] call Achilles_fnc_ShowZeusErrorMessage; 
	nil;
};

private _playerUnit = player;
private _damage_allowed = isDamageAllowed _playerUnit;
private _face = face _unit;
private _speaker = speaker _unit;
private _goggles = goggles _unit;
_unit setVariable ["Achilles_var_switchUnit_data",[name _unit, _playerUnit, _damage_allowed, _face, _speaker, _goggles], true];
bis_fnc_moduleRemoteControl_unit = _unit;

// fix teleportation bug: for some unkown reason the unit may get teleported to the camera position
curatorCamera setDir getDir _unit;
curatorCamera setPosWorld getPosWorld _unit;

selectPlayer _unit;
SQFM_dcUnit = _unit;

[_unit, _face] remoteExecCall ["setFace", 0];
[_unit, _speaker] remoteExecCall ["setSpeaker", 0];
[_unit, _goggles] spawn {
	params ["_unit", "_goggles"]; 
	sleep 1; 
	_unit addGoggles _goggles
};

_playerUnit disableAI "ALL";
_playerUnit enableAI "ANIM";
_playerUnit allowDamage false;

private _addActionID = [_unit] call SQFM_fnc_endDirectControlAction;
private _eh_id       = [_unit] call SQFM_fnc_handleDirectControlDamage;

_unit setVariable ["Achilles_var_switchUnit_addAction", _addActionID];
_unit setVariable ["Achilles_var_switchUnit_damageEHID",      _eh_id];

if(isClass (configfile >> "CfgPatches" >> "ace_medical")) then
{
    _eh_id = ["ace_unconscious", {if (_this select 1 and {_this select 0 == player}) then {[] call SQFM_fnc_switchUnit_exit}}] call CBA_fnc_addEventHandler;
    _unit setVariable ["Achilles_var_switchUnit_ACEdamageEHID", _eh_id];
};
