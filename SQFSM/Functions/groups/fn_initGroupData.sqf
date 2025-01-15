params [
    ["_group", nil, [grpNull]]
]; 
[_group] call SQFM_fnc_groupBehaviourSettings
params[
    ["_squadClass",      nil,    [""]],
    ["_defend",          nil,  [true]],
    ["_attack",          nil,  [true]],
    ["_hunt",            nil,  [true]],
    ["_huntDistance",    nil,     [0]],
    ["_huntKnowledge",   nil,     [0]],
    ["_reinforce",       nil,  [true]],
    ["_callReinforce",   nil,  [true]],
    ["_callArty",        nil,  [true]],
	["_exclude",         nil,  [true]],
	["_clearObjectives", nil,  [true]],
    ["_idleCover",       nil,  [true]],
    ["_callTransport",   nil,  [true]],
    ["_useNearVehicles", nil,  [true]],
    ["_forceTravelFoot", nil,  [true]],
    ["_allowBattleTask", nil,  [true]]
];

private _recon    = _squadClass isEqualTo "recon";
private _mapIcon  = "\A3\ui_f\data\map\markers\nato\b_inf.paa";
private _mapColor = [_group] call SQFM_fnc_squadMapColor;
private _3Dtxt    = ["100%", 0.546, "#ffffff", "#00000000", "PuristaBold"]call SQFM_fnc_getTextTexture;
private _emptyMap = createHashmapObject[[]];

if(_recon)then{
    _hunt         = false;
    _idleCover    = false;
    _huntDistance = 0;
    {
        _x setSkill ["spotTime",     1];
        _x setSkill ["spotDistance", 1];
        _x setSkill ["commanding",   1];
    } forEach units _group;
};

private _dataArr  = [ 
    ["birth",             round time],
    ["lastTransportCall", round time],
    ["lastActionTime",    round time],
    ["huntCoolDown",      round time],
    ["lastRegroup",       round time],
    ["lastReinfReq",           0-300],
    ["lastAtSupReq",           0-300],
    ["lastAtEngagement",       0-300],
    ["lastAtCheck",            0-300],
    ["lastFireCheck",          0-300],
    ["lastUpdate",             0-300],
    ["lastReconUpdate",        0-300],
    ["lastArtyCall",           0-300],
    ["artyRequestEnd",         0-300],
    ["action-flash",          [0,""]],
    ["grp",                   _group],
    ["owner",      groupOwner _group],
    ["side",             side _group],
    ["action",                    ""],
    ["state",                     ""],
	["groupType",          "unknown"],
    ["squadClass",       _squadClass],
    ["travelData",               nil],
    ["available",               true],
    ["awaitingReforce",        false],
    ["incomingReforce",           []],
    ["lastReforceArrival",        -1],
    ["awaitingReplenish",      false],
    ["battlefield",       [-1,-1,-1]],
    ["battleTimes",               []],
    ["shots",                     []],
    ["groupCluster",             nil],
    ["transportCrew",          false],
    ["mechClearing",           false],
    ["regrouping",             false],
    ["reconDanger",            false],
    ["transportVehicle",     objNull],
    ["leaderVehicle",        objNull],
    ["formation",   formation _group],
    ["initialStrength",            0],
    ["strengthIndicator",     _3Dtxt],
    ["mapIcon",             _mapIcon],
    ["mapColor",           _mapColor],
    ["objective",            objNull],
    ["activeArty",           objNull],
    ["taskData",           _emptyMap],
    ["unitEvHandlers",            []],

	// Will be used in debug mode to show when new
	// hostiles have been revealed through knowledge sharing.
	["hostilesRevealed",     [0,[]]],

    /**********Behaviour settings***********/
    ["canDefend",                    _defend],
    ["canAttack",                    _attack],
    ["canHunt",                        _hunt],
    ["huntDistance",           _huntDistance],
    ["huntKnowledge",         _huntKnowledge],
    ["canReinforce",              _reinforce],
    ["canCallReinforcements", _callReinforce],
    ["canCallArty",                _callArty],
	["exclude",                     _exclude],
	["clearObjectives",     _clearObjectives],
    ["canIdleCover",              _idleCover],
    ["canGetTransport",       _callTransport],
    ["canUseNearVehicles",  _useNearVehicles],
    ["forceTravelOnFoot",   _forceTravelFoot],
    ["allowBattleTask",     _allowBattleTask]
];

private _data = createHashmapObject [_dataArr];

// All methods(functions) related to this hashmap is found at "functions\groups\fn_setGroupMethods.sqf"
[_data] call SQFM_fnc_setGroupMethods;

_data call ["setGroupCluster"];
_data call ["setGroupType"];

private _veh1     = (_data call ["getVehiclesInUse"])#0;
if((!isNil "_veh1")
&&{_veh1 getVariable ["SQFM_transport", false]})
then{
    _exclude = false;
    _data set ["transportCrew",    true];
    _data set ["transportVehicle", _veh1];
    _data set ["exclude",          false];

};
// _data set  ["transportVehicle", _vehicle];
// _data call ["globalize"];

_data call ["update"];
_group setVariable ["SQFM_grpData",  _data,    true];
_group setVariable ["SQFM_Excluded", _exclude, true];


_data spawn { 
    sleep 3;
    private _strength = _this call ["getStrength"];
    _this set  ["initialStrength", _strength];
	_this call ["update"];
};

_data;