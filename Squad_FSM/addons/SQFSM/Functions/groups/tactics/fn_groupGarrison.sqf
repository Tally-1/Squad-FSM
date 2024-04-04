private _pos       = _self call ["getAvgPos"];
private _buildings =  [_pos, 75] call SQFM_fnc_nearBuildings;

if(_buildings isEqualTo [])exitWith{};

_pos = getPosATLVisual (selectRandom _buildings);

private _wp = (_self get "grp") addWaypoint [_pos, 0];
_wp setWaypointType "GARRISON";
_wp setWaypointScript "\x\cba\addons\ai\fnc_waypointGarrison.sqf";

_wp;