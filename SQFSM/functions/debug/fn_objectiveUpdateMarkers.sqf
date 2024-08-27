if!(SQFM_debugMode)exitWith{};
private _owner = _self get "owner";
private _color = [_owner,true] call SQFM_fnc_sideColor;

{_x setMarkerColor _color} forEach (_self get "markers");

true;