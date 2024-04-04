params[
    ["_data",nil,[createHashmap]]
];
private _methods =
[
    ["getGroupsInZone",   {(_self get"zone") call SQFM_fnc_groupsInZone}],
    ["timeSinceCapture",               {time - (_self get"captureTime")}],
    ["getSidesInZone",                  SQFM_fnc_objectiveGetSidesInZone],
    ["getAssignedAssets",            SQFM_fnc_objectiveGetAssignedAssets],
    ["countAssignedAssets",        SQFM_fnc_objectiveCountAssignedAssets],
    ["getContested",                      SQFM_fnc_objectiveGetContested],
    ["setContested",{_self set ["contested",_self call["getContested"]]}],
    ["inBattle",          {_self get"zone"call SQFM_fnc_posInBattleZone}],
    ["update",                                  SQFM_fnc_objectiveUpdate],
    ["troopsNeeded",                       SQFM_fnc_objectiveNeedsTroops],
    ["assignGroup",                        SQFM_fnc_objectiveAssignGroup],
    ["unAssignGroup",                    SQFM_fnc_objectiveUnAssignGroup],
	["draw3D",                              SQFM_fnc_drawObjectiveModule],
    ["setMethods",           {[_self] call SQFM_fnc_setObjectiveMethods}]
];

{
    private _name = _x#0;
    private _code = _x#1;
    _data set [_name, _code];
    
} forEach _methods;

true;