private _roadCount = count (_self get"roadmap"get"roads");
if(_roadCount < 10)exitWith{_self set["isUrbanArea",false]};

private _position  = (_self get "zone")#0;
private _radius    = (_self get "zone")#1;
private _buildings = _self get "buildings";
private _urbanArea = [_position, _radius, _buildings] call SQFM_fnc_isUrbanArea;
if!(_urbanArea)exitWith{_self set["isUrbanArea",false]};

_self set["isUrbanArea",true];