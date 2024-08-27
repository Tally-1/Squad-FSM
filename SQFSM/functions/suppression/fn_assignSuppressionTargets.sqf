params[
    ["_shooters",    nil,   [[]]],
    ["_targets",     nil,   [[]]],
    ["_setVariable", nil, [true]]   // If set to true a variable with the target is set on the shooter for later use.
];
if(_targets  isEqualTo [])exitWith{[]};
if(_shooters isEqualTo [])exitWith{[]};

private _endIndex    = count _targets;
private _targetIndex = 0;
private _assigned    = [];
{
    if(_targetIndex >= _endIndex)
    then{_targetIndex = 0};

    private _target = _targets#_targetIndex;

    if(typeName _target isEqualTo "OBJECT"
    &&{_target isKindOf "house"})
    then{_target = [aimPos _x, _target] call SQFM_fnc_getBuildingSuppressionPos};

    if(_setVariable)
    then{_x setVariable ["SQFM_suppressionTarget", _target]}
    else{_x doSuppressiveFire _target};

    _assigned pushBackUnique _target;

    _targetIndex=_targetIndex+1;
    
} forEach _shooters;

_assigned;