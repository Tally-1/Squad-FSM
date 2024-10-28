params[
    ["_target",nil,[objNull]]
];
private _invalid = !(_self call ["isValid"]);
if(_invalid)exitWith{false};

private _invalidTarget = !([_target]call SQFM_fnc_validAtTarget);
if(_invalidTarget)exitWith{false};

private _sinceLastGroupCall = time - (_self get "lastAtSupReq");
private _coolDown           = SQFM_atSupportCallCooldown;
if(_sinceLastGroupCall < _coolDown)exitWith{false};

private _group     = _self get "grp";
private _knowledge = _group knowsAbout _target;
if(_knowledge < 3.9)exitWith{false};

private _sinceLastTargetCall = time - (_target getVariable ["SQFM_lastAtTargetCall",0-300]);
private _coolDown            = 30;
if(_sinceLastTargetCall < _coolDown)exitWith{false};

private _hunterGrps = count(_target getVariable ["SQFM_hunterGrps", []]);
if(_hunterGrps >= 2)exitWith{false};

private _availGrps = count ([true] call SQFM_fnc_getAtSupportGroups);
if(_availGrps < 1)exitWith{false};

true;