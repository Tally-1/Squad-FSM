private _group      = _self get "grp";
private _side       = _self call ["getStrSide"];//side _group;
private _objectives = _self call ["getNearObjectives"] select {(_x call getData)call ["troopsNeeded",[_side]]};
if(_objectives isEqualTo [])exitWith{[]};

private _targetObjective = ([_objectives, _group] call SQFM_fnc_objectivesSorted)#0;

_self call ["takeObjective", [_targetObjective]];

[_group, _targetObjective];