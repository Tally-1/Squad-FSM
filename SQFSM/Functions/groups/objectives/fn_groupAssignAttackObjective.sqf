params[
    ["_excluded",[],[[]]] // Objectives excluded from the search
];
private _objectives = _self call ["getNearObjectives",[_excluded]];
private _strSide    = _self call ["getStrSide"];
private _side       = _self get "side";
private _group      = _self get "grp";
private _pos        = getPosATL leader (_self get "grp");
private _attackOnly = _self call ["canAttackOnly"];
private _selectionAlgo = { 
    private _objData        = _x call getData;
    private _needsTroops    = _objData call ["troopsNeeded",[_strSide, _attackOnly]];
    private _owner          = _objData get "owner";
    private _hostile        = [_side, _owner] call SQFM_fnc_hostile;
    private _notInside      = !(_self call ["isInsideObjective",[_x]]);
    private _validObjective = _needsTroops && {_hostile &&{_notInside}};
    

    // if!(_notInside)      then{[[_x, " Group is inside"]] call dbgm};
    // if!(_needsTroops)    then{[[_x, " No troops neded"]] call dbgm};
    // if!(_hostile)        then{[[_x, " is friendly"]]     call dbgm};
    // if!(_validObjective) then{[[_x, " Not valid"]]       call dbgm};

    _validObjective;
};

_objectives = _objectives select _selectionAlgo;
if(_objectives isEqualTo [])exitWith{[]};

private _targetObjective = [_pos, _objectives] call SQFM_fnc_getNearest;//([_objectives, _group] call SQFM_fnc_objectivesSorted)#0;
private _assignmentData  = [_group, _targetObjective];
_self call ["attackObjective", [_targetObjective]];

_assignmentData;