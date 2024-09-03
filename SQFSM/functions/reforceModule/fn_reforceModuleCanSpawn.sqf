params[
    ["_callPos", nil,        [[]]],
    ["_caller",    nil, [grpNull]]
];
_self call ["updateSquads"];

// Check max field limit 
private _inGameCount = count(_self get "squads_ingame");
private _inGameMax   = _self get "max_ingame";
if(_inGameCount >= _inGameMax)exitWith{false};

// Too frequent spawns may cause collisions
private _timeSince = time - (_self get "last_spawn");
if(_timeSince < 10)exitWith{false};

// Check that the pool has not been spent.
private _sent = _self get "sentCount";
private _max  = _self get "maxCount";
if(_sent >= _max)exitWith{false};

// Check that the distance (if defined) is within range.
private _module   = _self get "module";
private _range    = _self get "maxRange";
private _distance = if(isNil "_targetPos")then{0}else{_module distance _targetPos};
if(_distance > _range)exitWith{false};

// Check that the caller (if defined) is of the correct side.
private _ownSide    = _self get "side";
private _callerSide = if(isNil "_caller")then{civilian}else{side _caller};
if(_ownSide != _callerSide)exitWith{false};

// Check that synchronized objectives are not hostile or contested.
private _hostile = _self call ["hostileObjective"];
if(_hostile)exitWith{false};

true;