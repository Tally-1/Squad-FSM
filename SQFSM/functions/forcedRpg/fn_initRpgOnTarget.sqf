params[
    ["_man",    nil,[objNull]],
    ["_target", nil,[objNull]]
];
private _firedEh      = _man addEventHandler ["Fired",    SQFM_fnc_onForcedRpgFire];
private _animEh       = _man addEventHandler ["AnimDone", SQFM_fnc_onForcedRpgAnim];

_man setVariable ["SQFM_rpgTarget",   _target];
_man setVariable ["SQFM_rpgFiredEh", _firedEh];
_man setVariable ["SQFM_rpgAnimEh",   _animEh];

_man disableAI "path";
_man setUnitPos "UP";

true;