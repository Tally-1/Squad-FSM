params[
    ["_building",nil,[objNull]]
];
private _posCount  = count (_building buildingPos -1);
private _movingIn  = _building getVariable ["SQFM_movingIn",0];
private _menInside = count([_building] call SQFM_fnc_menInsideBuilding);
private _occupants = _menInside+_movingIn;


_posCount=_posCount-_occupants;

_posCount;