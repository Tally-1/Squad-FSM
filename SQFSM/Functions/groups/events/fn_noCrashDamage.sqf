params [
    ["_man",       nil,  [objNull]],
    ["_selection",  nil,      [""]],
    ["_damage",     nil,       [0]],
    ["_source",     nil, [objNull]],
    ["_projectile", nil,      [""]]
];
private _context = _this#9;
if(_context isEqualTo 3)exitWith{};

// Normal damage on valid projectile
private _validProjectile = _projectile isNotEqualTo "";
if(_validProjectile)exitWith{};

// Avoid multiple checks on the same incident
private _lastCheck       = _man getVariable ["SQFM_lastCrshCheck",0];
if(time - _lastCheck < 0.01) exitWith{
    private _lastCrash = _man getVariable ["SQFM_lastCrash",0];
    if(time - _lastCrash < 0.1)exitWith{0};
    nil;
};

_man setVariable ["SQFM_lastCrshCheck", time];

// Invalid projectile while inside a vehicle indicates a crash.
private _inVehicle = typeOf vehicle _man isNotEqualTo typeOf _man;
if(_inVehicle)exitWith{ 
    _man setVariable ["SQFM_lastCrash", time];
    0;
};

// if the man just got run over he will most likely be unconscious.
private _uncon = [_man] call SQFM_fnc_unconscious;
if(_uncon)exitWith{ 
    _man setVariable ["SQFM_lastCrash", time];
    0;
};

// a crash will usually return the vehicle as a source, 
// if there is no source it is assumed it is fall damage
if(isNull _source)exitWith{};

// If the source is hostile then the damage is normal
private _hostile = [_man, _source] call SQFM_fnc_hostile;
if!(_hostile)exitWith{
    _man setVariable ["SQFM_lastCrash", time];    
    0;
};

nil;