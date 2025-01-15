params[
    ["_availableOnly",nil,[true]]
];
private _vehicles = _self call ["getVehiclesInUse"];
private _artys    = _vehicles select {[_x] call SQFM_fnc_isArtillery};
if(!_availableOnly)exitWith{_artys};

private _available = _artys select {
    private _status = [_x] call SQFM_fnc_artilleryStatus;
    private _ready  = _status isEqualTo "ready";
    _ready;
};

_available;