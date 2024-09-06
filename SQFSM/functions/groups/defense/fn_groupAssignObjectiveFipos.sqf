params[
    ["_objective", nil,[objNull]]
];
if!(SQFM_SFSM)exitwith{[]};

private _objData = _objective call getData;
private _zone    = _objData get "zone";
private _area    = _objData get "area";
private _fipos   = ((_zone#0) nearEntities ["SFSM_FIPO", (_zone#1)]) select {_x inArea _area};
private _men     = _self call ["getUnitsOnfoot"];

if(_fipos isEqualTo [])exitWith{[]};

// Due to the unstop function the men needs to have the cooldown removed fpr fipos 
{[_x, "lastFipoAttempt", time-20] call SFSM_fnc_unitData} forEach _men;

// Assign men to the FIPOs
private _fipoMen = _self call ["assignFipos",[_fipos]];

_fipoMen;