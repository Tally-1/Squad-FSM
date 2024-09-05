params[
    ["_objective", nil,[objNull]]
];
private _objData = _objective call getData;
private _zone    = _objData get "zone";
private _area    = _objData get "area";
private _fipos   = ((_zone#0) nearEntities ["SFSM_FIPO", (_zone#1)]) select {_x inArea _area};

if(_fipos isEqualTo [])exitWith{[]};

private _fipoMen = _self call ["assignFipos",[_fipos]];

_fipoMen;