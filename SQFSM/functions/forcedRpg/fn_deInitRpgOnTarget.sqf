params[
    ["_man",nil,[objNull]]
];
private _firedEh = _man getVariable "SQFM_rpgFiredEh";
private _animEh  = _man getVariable "SQFM_rpgAnimEh";

_man setVariable ["SQFM_rpgTarget",  nil];
_man setVariable ["SQFM_rpgFiredEh", nil];
_man setVariable ["SQFM_rpgAnimEh",  nil];
_man setVariable ["SQFM_rpgFired",   nil];
_man setVariable ["SQFM_launchPos",  nil];
_man setVariable ["SFSM_excluded",   nil];

_man enableAI   "path";
_man enableAI   "anim";
_man enableAI   "move";
_man setUnitPos "AUTO";

if(isNil "_firedEh")exitWith{};
_man removeEventHandler ["Fired",    _firedEh];
_man removeEventHandler ["AnimDone",  _animEh];


true;