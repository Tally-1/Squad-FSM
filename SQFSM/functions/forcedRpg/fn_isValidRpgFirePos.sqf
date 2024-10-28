params[
    ["_shooter",   nil, [objNull]],
    ["_target",    nil, [objNull]],
    ["_firePos",   nil,      [[]]]
];
private _validPos = false;
if(isNil "_firePos")then{
    _firePos = (getPosASLVisual _shooter)vectorAdd[0,0,1.4];
};

isNil{//Unscheduled execution for better performance.

if(_firePos distance2D _target < 20)exitWith{};

private _topPos     = _firePos vectorAdd [0, 0, 5];
private _linebreaks = lineIntersectsSurfaces [_firePos, _topPos, _shooter, objNull, true, 3];
private _buildings  = _linebreaks select {(_x#3) isKindOf "house"};
if(_buildings isNotEqualTo [])exitWith{};

private _ignoreList = [_target, _shooter]; 
{_ignoreList pushBackUnique vehicle _x} forEach (units group _shooter);
{_ignoreList pushBackUnique vehicle _x} forEach (units group _target);

private _noLOS = [_firePos, aimPos _target, _ignoreList] call SQFM_fnc_lineBroken; // ([_shooter, "VIEW", _target] checkVisibility [_firePos, (aimPos _target)])<1; // 
if(_noLOS)exitWith{};

_validPos = true;
};

_validPos;