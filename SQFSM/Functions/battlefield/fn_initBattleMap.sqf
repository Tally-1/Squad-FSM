params[ 
    ["_pos",    nil, [[]]],
    ["_rad",    nil,  [0]]
];
private _zone         = [_pos,_rad];
private _entities     = (_pos nearEntities ["land", _rad])select {[_x] call SQFM_fnc_validLandEntity};
private _objDataArr   = [_entities] call SQFM_fnc_objArrData;
private _sides        = _objDataArr#3;
private _groups       = _objDataArr#4;
private _grid         = [_pos, _rad]   call SQFM_fnc_getBattleGrid;
private _edgeLines    = [_pos, _rad]   call SQFM_fnc_getCircleLines;
private _strengthData = createHashmap;//[_zone, _groups] call SQFM_fnc_zoneStrengthBySide;
private _reinforData  = createHashmap;

private _dataArr = [
    /******************Data*************************/
    ["position",                _pos],
    ["machine",          clientOwner],
    ["radius",                  _rad],
    ["zone",                   _zone],
    ["startTime",               time],
    ["sides",                 _sides],
    ["groups",               _groups],
    ["entities",           _entities],
    ["forcedEnd",              false],
    ["buildings",                 []],
    ["grid",                   _grid],
	["edgeLines",         _edgeLines],
    ["groupShots",                []],
    ["shotsFired",             false],
	["urbanZones",                []],
    ["strengthData",   _strengthData],
    ["reinforData",     _reinforData],
    ["reinForTime",             time],
    ["updateTime",           time-30],
    ["activeReinforcements",      []],

    /******************Methods*************************/
    ["initGroups",                     SQFM_fnc_initBattleGroups],
    ["initGlobal",                     SQFM_fnc_initBattleGlobal],
    ["postInit",           {_self spawn SQFM_fnc_postInitBattle}],
	["update",                             SQFM_fnc_updateBattle],
    ["updateBuildings",           SQFM_fnc_updateBattleBuildings],
    ["endGroups",                       SQFM_fnc_endBattleGroups],
    ["handleInvalidGrps",     SQFM_fnc_handleInvalidBattleGroups],
    ["handleNewGroups",           SQFM_fnc_handleNewBattleGroups],
    ["endBattle",                             SQFM_fnc_endBattle],
    ["drawBattle",                           SQFM_fnc_drawBattle],
    ["reinforcements",             SQFM_fnc_battleReinforcements],
    ["replenishGroups",           SQFM_fnc_battleReplenishGroups],
    ["sideNeedReforce",   SQFM_fnc_battleSideNeedsReinforcements],
    ["reinforceSide",               SQFM_fnc_battleReinforceSide],
    ["updateStrengthData",     SQFM_fnc_battleUpdateStrengthData],
    ["updateReforData",           SQFM_fnc_battleUpdateReforData],
    ["broadcastBattleHud",        SQFM_fnc_updateBattleHudGlobal],
    ["onFirstShot",                   SQFM_fnc_onBattleFirstShot],
	["timeSinceShot",           SQFM_fnc_timeSinceLastBattleShot],
    ["shareKnowledge",             SQFM_fnc_shareBattleKnowledge],
	["initBuildings", {_self spawn SQFM_fnc_initBattleBuildings}]
];

private _battleMap = createHashmapObject [_dataArr];

_battleMap call ["initBuildings"];

SQFM_latestBattle = _battleMap;

_battleMap;