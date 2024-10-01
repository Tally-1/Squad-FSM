params[
    ["_excluded",  [],      [[]]], // Objectives excluded from the search
    ["_isDefense", false,[false]]
];
if!(_self call ["canAssignObjective",[true]])exitWith{[]};

// Attack groups only assigns to hostile or neutral objectives.
if(_self call ["canAttackOnly"])
exitWith{_self call ["assignAttackObjective",[_excluded]]};

// Defense groups only assigns to friendly objectives (including contested objectives).
if(_self call ["canDefendOnly"]
||{_isDefense})
exitWith{_self call ["assignDefenseObjective",[_excluded]]};


private _group      = _self get "grp";
private _side       = side _group;
private _strSide    = _self call ["getStrSide"];//side _group;
private _objectives = _self call ["getNearObjectives",[_excluded]];

_objectives = _objectives select{
        private _objData = _x call getData;
        private _valid = (_objData call ["troopsNeeded",[_strSide]]) &&{_side in (_objData get "allowedSides")};
        _valid;
};

if(_objectives isEqualTo [])exitWith{[]};

private _targetObjective = ([_objectives, _group] call SQFM_fnc_objectivesSorted)#0;
private _objective  = _self get "objective";
if(_objective isEqualTo _targetObjective)exitWith{[]};

_self call ["takeObjective", _targetObjective];
private _assignmentData  = [_group, _targetObjective];

if(canSuspend)
then{sleep 1};


_assignmentData;