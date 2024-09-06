params[
    ["_objective", nil,[objNull]]
];
if!(SQFM_SFSM)exitwith{[]};

private _leader  = leader (_self get"grp"); 
private _objData = _objective call getData;
private _zone    = _objData get "zone";
private _area    = _objData get "area";
private _pos     = _zone#0;
private _rad     = _zone#1;
private _turrets = vehicles select {_x inArea _area &&{[_x] call SFSM_fnc_isTurret}};


[_leader, _turrets] call SFSM_fnc_assignMenToTurrets;

true;