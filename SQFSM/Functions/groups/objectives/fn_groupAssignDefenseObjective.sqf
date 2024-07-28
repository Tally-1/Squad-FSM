params[
    ["_excluded",[],[[]]] // Objectives excluded from the search
];
private _objectives = _self call ["getNearObjectives",[_excluded]];
private _strSide    = _self call ["getStrSide"];
private _side       = _self get "side";
private _group      = _self get "grp";
private _pos        = getPosATL leader (_self get "grp");

// This algorithm only selects friendly owned objectives that need troops.
private _selectionAlgo = { 
    private _objData        = _x call getData;
    private _owner          = _objData get "owner";
    private _friendly       = !([_group, _owner] call SQFM_fnc_hostile);
    private _validObjective = _friendly && {_objData call ["troopsNeeded",[_strSide]]};


    _validObjective;
};

_objectives = _objectives select _selectionAlgo;
if(_objectives isEqualTo [])exitWith{[]};

// This algorithm reduces the percived distance to the objective based the need for defenders.
private _sortingAlgo = { 
    private _objData      = _x call getData;
    private _distance     = (_objData get "position") distance2D _pos;
    private _isContested  = _objData call ["getContested"];
    private _enemyPresent = count (_objData call ["getSidesInZone"])>1;
    private _friendlyGrps = count (_objData get "assignedGroups"get _strSide);

    if(_isContested)      then{_distance = _distance*0.5};
    if(_enemyPresent)     then{_distance = _distance*0.8};
    if(_friendlyGrps < 2) then{_distance = _distance*0.8};

    _distance;
};

private _objective  = _self get "objective";
private _targetObjective = ([_objectives, [], _sortingAlgo, "ASCEND"] call BIS_fnc_sortBy)#0;//(_self call ["sortDefenseObjectives",[_objectives]]);//[_pos, _objectives] call SQFM_fnc_getNearest;//([_objectives, _group] call SQFM_fnc_objectivesSorted)#0;
if(_objective isEqualTo _targetObjective)exitWith{[]};

private _assignmentData  = [_group, _targetObjective];

_self call ["takeObjective", [_targetObjective]];

_assignmentData;