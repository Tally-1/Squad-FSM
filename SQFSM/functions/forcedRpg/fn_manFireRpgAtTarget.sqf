params[
    ["_man",    nil,[objNull]],
    ["_target", nil,[objNull]],
    ["_retry",  nil,   [true]]
];
private _valid = [_target] call SQFM_fnc_validAtTarget;
if!(_valid)exitWith{false};

private _launcherAnim = "AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWlnrDnon_end";
private _launcher     = secondaryWeapon _man;
private _launchPos    = _man getVariable "SQFM_launchPos";
private _noLOS        = !([_man, _target] call SQFM_fnc_isValidRpgFirePos);
private _targetPos    = ASLToATL eyePos  _target;
private _arrived      = (_man distance2D _launchPos)<5;

// Try again if possible.
if(_noLOS && {_retry})exitWith{
    [_man, "Targeting failed, trying again"] spawn SQFM_fnc_flashActionMan;
    [_man,_target,false] spawn SQFM_fnc_manEngageAtTarget;
};

// No LOS after 2 attempts aborts the operation.
if(_noLOS)exitWith{
    [_man, true] call SQFM_fnc_manToggleExternalAi;
    [_man, "No LOS on target"] spawn SQFM_fnc_flashActionMan;
};

[_man, "Firing on target"] spawn SQFM_fnc_flashActionMan;

_this call SQFM_fnc_initRpgOnTarget;
[_man, _targetPos, 10] spawn SQFM_fnc_forceLookAtPos;

_man playMoveNow _launcherAnim;
_man selectWeapon _launcher;

_this spawn SQFM_fnc_endRpgOnTarget;