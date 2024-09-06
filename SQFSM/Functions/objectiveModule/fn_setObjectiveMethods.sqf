params[
    ["_data",nil,[createHashmap]]
];
private _globalizeFnc      = {(_self get "module") setVariable ["SQFM_objectiveData", _self, true]};
private _getUrbanPositions = {(_self get"urbanZones")apply{_x get "position"}};
private _methods =
[
    ["getGroupsInZone",   {(_self get"zone") call SQFM_fnc_groupsInZone}],
    ["timeSinceCapture",               {time - (_self get"captureTime")}],
    ["getSidesInZone",                  SQFM_fnc_objectiveGetSidesInZone],
    ["getZoneMidPositions",        SQFM_fnc_objectiveGetZoneMidPositions],
    ["getUrbanPositions",                             _getUrbanPositions],
    ["getFipos",                              SQFM_fnc_objectiveGetFipos],
    // ["initRoadmap",                        SQFM_fnc_objectiveInitRoadmap],

    ["getAssignedAssets",            SQFM_fnc_objectiveGetAssignedAssets],
    ["countAssignedAssets",        SQFM_fnc_objectiveCountAssignedAssets],
    ["getContested",                      SQFM_fnc_objectiveGetContested],
    ["setContested",                      SQFM_fnc_objectiveSetContested],
    ["inBattle",          {_self get"zone"call SQFM_fnc_posInBattleZone}],
    ["update",                                  SQFM_fnc_objectiveUpdate],
    ["onCapture",                            SQFM_fnc_objectiveOnCapture],
    ["updateMarkers",                    SQFM_fnc_objectiveUpdateMarkers],
    ["troopsNeeded",                       SQFM_fnc_objectiveNeedsTroops],
    ["assignGroup",                        SQFM_fnc_objectiveAssignGroup],
    ["unAssignGroup",                    SQFM_fnc_objectiveUnAssignGroup],
	["draw3D",                              SQFM_fnc_drawObjectiveModule],
    ["storeSafePosSearch",          SQFM_fnc_objectiveStoreSafePosSearch],
    ["removeSafePosSearches",    SQFM_fnc_objectiveRemoveSafePosSearches],
    ["setUrbanStatus",                  SQFM_fnc_objectiveSetUrbanStatus],
    ["setMethods",           {[_self] call SQFM_fnc_setObjectiveMethods}],
    ["getZoneCone",                        SQFM_fnc_objectiveGetZoneCone],
    // ["setPosgrid"                           SQFM_fnc_objectiveSetPosgrid],
    ["globalize",                                          _globalizeFnc]
];
// 
{
    private _name = _x#0;
    private _code = _x#1;
    _data set [_name, _code];
    
} forEach _methods;

true;