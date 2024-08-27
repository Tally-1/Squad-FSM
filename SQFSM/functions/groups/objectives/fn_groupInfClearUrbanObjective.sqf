params[
    ["_objective",nil,[objNull]]
];
private _searchPositions = _self call ["getUrbanObjInfSearchP",[_objective]];
if(_searchPositions isEqualTo [])
exitWith{
    "No urban zones found" call dbgm;
    _self call ["infClearObjective",[_objective]];
};

private _wpFnc      = "SQFM_fnc_searchNearBuildings";
private _endFnc     = "SQFM_fnc_endTaskGroup";
private _endParams  = [_center,10,"MOVE", _endFnc,"AWARE","NORMAL",10];

{
    private _wpParams = [_x,10,"MOVE",_wpFnc,"AWARE","NORMAL",10];
    _self call ["addWaypoint", _wpParams]

}forEach _searchPositions;

_self call ["addWaypoint", _endParams];
_self set  ["action", "Clearing Urban Objective"];


true;