private _group  = group player;
private _leader = leader _group;
private _data   = _group call getData;
if(isNil "_data")
exitWith{"no_data"};

if(_leader != player)
exitWith{"not_leader"};

private _vehicle  = _data get "transportVehicle";
private _validVeh = [_vehicle] call SQFM_fnc_validVehicle;
if(_validVeh)
exitWith{"has_transport"};

private _vehicle = (_data call ["getVehiclesInUse"])#0;
if(!isNil "_vehicle")
exitWith{"has_vehicle"};

private _valid = _data call ["isValid"];
if(!_valid)
exitWith{"invalid"};

private _pos     = _data call ["getAvgPos"];
private _enemies = [_group,[_pos, 300]] call SQFM_fnc_enemiesInZone;
if(_enemies isNotEqualTo [])
exitWith{"near_enemy"};

"ready"