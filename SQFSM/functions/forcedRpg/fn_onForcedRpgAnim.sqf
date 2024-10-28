params[
    ["_man",  nil, [objNull]],
    ["_anim", nil,      [""]]
];
private _launcher    = secondaryWeapon _man;
private _wantedAnim  = toLower "AmovPercMstpSrasWlnrDnon";
private _correctAnim = _wantedAnim in (toLower _anim);
private _target      = _man getVariable "SQFM_rpgTarget";
if!(_correctAnim)exitWith{};

_man disableAI "anim";
_man disableAI "move";
_man selectWeapon _launcher;
_man doFire _target;

[_man] spawn SQFM_fnc_forceLauncherFire;

_man removeEventHandler [_thisEvent, _thisEventHandler];