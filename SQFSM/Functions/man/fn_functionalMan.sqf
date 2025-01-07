params [
    ["_man",             nil,   [objNull]],
    ["_ignoreFipo",      false,    [true]],
    ["_ignorePath",      false,    [true]],
    ["_ignoreVehicle",   false,    [true]],
    ["_includeExcluded", false,    [true]]
];
private _notPlayer     = !(_man in allPlayers);
private _isMan         = [_man] call SQFM_fnc_isRealMan;
private _checkPath     = _ignorePath isEqualTo false;
private _checkFipo     = _ignoreFipo isEqualTo false;
private _checkExcluded = _includeExcluded isEqualTo false;
private _checkVehicle  = _ignoreVehicle   isEqualTo false;
private _dead          = !alive _man;

if(_dead)   exitWith{false};
if!(_isMan) exitWith{false};

private _wrongSide = !((side group _man) in [west, east, independent]);
if(_wrongSide)exitWith{false;};

private _inVehicle = _checkVehicle &&{vehicle _man!=_man};
if(_inVehicle)exitWith{false};

private _unconscious = [_man] call SQFM_fnc_unconscious;
if(_unconscious)exitWith{false};

private _moveEnabled = _man checkAIFeature "MOVE";
private _animEnabled = _man checkAIFeature "ANIM";
private _pathEnabled = _man checkAIFeature "PATH";

private _pathOff = _checkPath && {_notPlayer && {!(_moveEnabled &&{_animEnabled && {_pathEnabled}})}};
if(_pathOff)exitWith{false};

private _excluded = _checkExcluded && {_man getVariable ["SQFM_Excluded", false] || {(group _man) getVariable ["SQFM_Excluded", false]}};
if(_excluded)exitWith{false};

private _inFipo = _checkFipo && {[_man] call SQFM_fnc_manInFipo};
if(_inFipo)exitWith{false};

private _captive = _man getVariable ["SFSM_captive",  false] || {captive _man};
if(_captive)exitWith{false};

private _grpData = (group _man) call getData;
if(isNil "_grpData")exitWith{false};

true;