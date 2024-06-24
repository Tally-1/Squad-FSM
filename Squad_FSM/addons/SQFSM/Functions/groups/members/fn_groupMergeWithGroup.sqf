params[
    ["_targetGroup",nil,[grpNull]]
];
private _units = units (_self get "grp");
_units join _targetGroup;

private _failedJoins = _units select {group _x != _targetGroup};
if(_failedJoins isEqualTo [])exitWith{};

for"_i" from 1 to 3 do
{
    if(_failedJoins isEqualTo [])exitWith{};

    _failedJoins joinSilent _targetGroup;

    if(canSuspend)then{sleep 0.1};  

    _failedJoins = _units select {group _x != _targetGroup};
};

true;