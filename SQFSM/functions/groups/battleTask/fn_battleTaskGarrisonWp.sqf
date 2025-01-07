params[
    ["_group",nil,[grpNull]]
];
private _grpData    = _group call getData;
private _battleTask = _grpData get "battleTask";
if(isNil "_battleTask")          exitWith{};
if(_battleTask get "garrisoned") exitWith{};

// Sort near buildings to get as far away from the enemy as possible.
private _hostilePos  = _battleTask call ["avgHostilePos"];
private _garrisonNow = _battleTask call ["garrisonNow",[_hostilePos]];
if(_garrisonNow)exitWith{};

_battleTask call ["end",[true]];

true;