params[
    ["_man",    nil, [objNull]],
    ["_target", nil, [objNull]],
    ["_retry",  true,   [true]]
];
private _maxDistance = SQFM_maxRpgRange+100;
private _distance    = _man distance2D  _target;
if(_distance>_maxDistance)
exitWith{"no RPG, too far" call dbgm};

private _launchPos = [_man, _target] call SQFM_fnc_getRpgLaunchPos;
if(isNil "_launchPos")
exitWith{"no RPG launch-pos" call dbgm};

private _functional = [_man,true] call SQFM_fnc_validMan;
if!(_functional)exitWith{};

private _distance  = _man distance2D _launchPos;
private _time      = _distance + 60;
private _onArrival = [[_man, _target, _retry], SQFM_fnc_manFireRpgAtTarget];
private _condition = [[_man, _target], SQFM_fnc_manEngageAtTargetCondition];

_man setVariable ["SQFM_launchPos", _launchPos];
_man setVariable ["SFSM_excluded",        true];

[
    _man, 
    _launchPos, 
    _time, 
    1,
    _onArrival,
    _condition
] call SQFM_fnc_fsmMoveManToPos;

true;