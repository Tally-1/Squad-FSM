private _group   = _self get "group";
private _grpData = _group call getData;
private _target = _self call ["newTarget"];

if(isNil "_target") exitWith{_self call ["end",[false]]};
if(isNull _target)  exitWith{_self call ["end",[false]]};

_self set ["target",_target];
_self set ["type",   "hold"];
_grpData call ["toggleExternalAi",[false]];

private _hostilePos  = _self call ["avgHostilePos"];
private _canGarrison = _self call ["canGarrison"];
private _garrisonNow = _canGarrison &&{_self call ["garrisonNow",[_hostilePos]]};
if(_garrisonNow) exitWith{};
if(!_canGarrison)
exitWith{_self call ["moveToSafePos"]};

private _safeZones = _self call ["safeUrbanZones"];
if(_safeZones isEqualTo [])
exitWith{_self call ["moveToSafePos"]};

private _safePos = (_safeZones#0) get "position";


_grpData call ["deleteWaypoints"];
_grpData call ["disableAttack"];

private _wp = _grpData call ["addWaypoint",[_safePos, 20,"MOVE", "SQFM_fnc_battleTaskGarrisonWp"]];
_self set ["waypoints",     [_wp]];
_self set ["garrisoned",    false];
_self set ["holdInPlace",   false];
_self set ["destination",_safePos];