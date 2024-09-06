private _zone      = _self get"zone";
private _area      = _self get"area";
private _pos       = _zone#0;
private _rad       = _zone#1;
private _fipos     = (_pos nearEntities ["SFSM_FIPO", _rad]) select {_x inArea _area};

_fipos;