private _group      = _self get "group";
private _grpData    = _group call getData;
private _battle     = _self get "battle";
private _urbanZones = _battle get "urbanZones";

if(_urbanZones isEqualTo [])          exitWith{false};
if(_grpData call ["isInfantryGroup"]) exitWith{true};
if(_grpData call ["isMechanized"])    exitWith{true};

false;