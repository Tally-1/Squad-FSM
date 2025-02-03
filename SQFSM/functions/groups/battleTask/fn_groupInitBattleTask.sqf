params[
    ["_battle",nil,[createHashmap]]
];
if!(_self call ["isValid"])exitWith{};

private _status    = _self call ["getBattleStatus",        [_battle]];
private _hostiles  = _self call ["getHostileBattleGroups", [_battle]];
if(_hostiles isEqualTo [])exitWith{};

private _squadType = _self get "groupType";
private _dataArr   = [
    ["type",                       "init"],
    ["startTime",              round time],
    ["battle",                    _battle],
    ["group",           (_self get "grp")],
    ["status",                    _status],
    ["hostiles",                _hostiles],
    ["destination",               [0,0,0]],
    ["target",                    grpNull],
    ["waypoints",                      []],
    ["garrisoned",                  false],
    ["holdInPlace",                 false],

    /***********************{METHODS}************************/
    ["init",                          SQFM_fnc_battleTaskInit],
    ["initPush",                  SQFM_fnc_battleTaskInitPush],
    ["initFlank",                SQFM_fnc_battleTaskInitFlank],
    ["initHold",                  SQFM_fnc_battleTaskInitHold],
    ["newTarget",                SQFM_fnc_battleTaskNewTarget],
    ["newFlankTarget",      SQFM_fnc_battleTaskNewFlankTarget],
    ["update",                      SQFM_fnc_battleTaskUpdate],
    ["updatePush",              SQFM_fnc_battleTaskUpdatePush],
    ["updateFlank",            SQFM_fnc_battleTaskUpdateFlank],
    ["updateHold",              SQFM_fnc_battleTaskUpdateHold],
    ["holdInTheOpen",        SQFM_fnc_battleTaskHoldInTheOpen],
    ["updateHoldInPlace",SQFM_fnc_battleTaskUpdateHoldInPlace],
    ["getHoldFormDir",      SQFM_fnc_battleTaskGetHoldFormDir],
    ["endFlanking",            SQFM_fnc_battleTaskEndFlanking],
    ["canGarrison",            SQFM_fnc_battleTaskCanGarrison],
    ["garrisonNow",            SQFM_fnc_battleTaskGarrisonNow],
    ["avgHostilePos",        SQFM_fnc_battleTaskAvgHostilePos],
    ["safeUrbanZones",      SQFM_fnc_battleTaskSafeUrbanZones],
    ["safeDirection",        SQFM_fnc_battleTaskSafeDirection],
    ["moveToSafePos",        SQFM_fnc_battleTaskMoveToSafePos],
    ["canSwitchTask",            SQFM_fnc_battleTaskCanSwitch],
    ["battleTime",              SQFM_fnc_battleTaskBattleTime],
    ["end",                            SQFM_fnc_battleTaskEnd]
    
];
private _task = createHashmapObject [_dataArr];

_self set  ["battleTask",    _task];
_self call ["leaveUnarmedVehicles"];
_task call ["init"];

_task;