_this pushBack _self;
_this spawn{
params[
    ["_callPos",     nil,              [[]]], // The position the call was made from.
    ["_callerGrp",   nil, [grpNull,objNull]], // The group/trigger who made the request. 
    ["_time",        nil,               [0]], // Time when the request for reinforcement was made.
    ["_self",        nil,   [createHashmap]]  // the hashmapObject belonging to the responding group (this group)
];
private _isTrigger  = typeName _callerGrp isEqualTo "OBJECT" &&{"EmptyDetector" in typeOf _callerGrp};
private _notTrigger = _isTrigger isEqualTo false;
private _insertPos  = _self call ["reinforceInsertPos",[_callPos]];
private _canTravel  = _self call ["initTravel",[_insertPos]];
if!(_canTravel)
exitWith{"Could not travel to reinforce squad." call dbgm;};

private _group       = _self get "grp";
private _posName     = [_callPos] call SQFM_fnc_areaName;
private _callerData  = _callerGrp call getData;

if(isNil "_callerData"
&&{_notTrigger})
exitWith{"Nil callerData" call dbgm};

private _callerType  = if(_notTrigger)then{_callerData get "groupType"}else{"Trigger"};
private _battlefield = if(_notTrigger)then{_callerData call ["getBattle"]}else{[_callPos] call SQFM_fnc_getBattleOnPos};
private _taskName    = ["Reinforce ", (_callerType), " at ", _posName]joinString"";
private _taskParams  = [_callPos, _callerGrp];
private _zone        = [_callPos, 300];
private _arrivalCode = {(_self call ["ownerData"]) call ["onReinforceArrival"]};
private _endCode     = {(_self call ["ownerData"]) call ["endReinforcing"]};

if(!isNil "_callerData")then{ 
    private _caller     = leader _callerGrp;
    private _playerCall = _caller in allPlayers;
    (_callerData get "incomingReforce")pushBackUnique _group;
    _callerData set["awaitingReforce",true];
    _callerData call ["globalize"];

    // Make sure GUI is working remotely.
    if(_playerCall)then{_caller spawn{
        sleep 1;
        [] remoteExec ["SQFM_fnc_showReforceData",_this];
    }};
};

if!(isNil "_battlefield")
then{
    _taskParams pushBack _battlefield;
    (_battlefield get "activeReinforcements") pushBackUnique _group;
};

private _task = _self call ["initTask",
[
    _taskName,     // Taskname     ["name"]
    _zone,         // Task zone    ["zone"]
    [_callPos],    // Positions    ["positions"]
    _taskParams,   // TaskParams   ["params"]
    _arrivalCode,  // Arrival-code ["arrivalCode"]
    _endCode       // End-code     ["endCode"]
]];

_self call ["waitForTransportSpawn"];

private _travelData       = _self get "travelData";
private _transportVehicle = _self get "transportVehicle";
private _validVehicle     = (!isNil "_transportVehicle")&&{alive _transportVehicle};

if((isNil "_travelData")
&&{_validVehicle isEqualTo false})
exitWith{
    _callerData set ["awaitingReforce", false];
    "No traveldata" call dbgm;
};

private _transportGroup = group driver _transportVehicle;
private _noVeh          = _validVehicle isEqualTo false;
private _exitCode       = {[_group, (currentWaypoint _group)] setWaypointCompletionRadius 300};
if(_noVeh)exitWith _exitCode;

private _noWpg = count waypoints _group          < 3;
if(_noWpg)exitWith _exitCode;

private _noWpt = count waypoints _transportGroup < 3;
if(_noWpt)exitWith _exitCode;

private _side           = side _group;

private _wpG            = (waypoints _group)#2;
private _wpT            = (waypoints _transportGroup)#2;
private _danger         = [_side, _insertPos, 100] call SQFM_fnc_posIsHostile;
private _completionRad  = 50;

if(_danger)then{_completionRad = 300};

_wpG setWaypointCompletionRadius _completionRad;
_wpT setWaypointCompletionRadius _completionRad;

// "wayPoint comp rad has been set to 300" call dbgm;

true;
};