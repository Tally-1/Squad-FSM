params[
    ["_targetGroup",nil,[grpNull]]
];
private _units  = units (_self get "grp");
private _leader = leader _targetGroup;

_units join _targetGroup;

private _failedJoins = _units select {group _x != _targetGroup};
if(_failedJoins isEqualTo [])exitWith{true};

for"_i" from 1 to 3 do
{
    if(_failedJoins isEqualTo [])exitWith{};

    _failedJoins joinSilent _targetGroup;

    if(canSuspend)then{sleep 0.1};  

    _failedJoins = _units select {group _x != _targetGroup};
};

_units = _units select{!(_x in _failedJoins)};

{
    _x doMove (getPos _x);
    _x doFollow _leader;
    
} forEach _units;

if(_failedJoins isEqualTo [])exitWith{true};

false;