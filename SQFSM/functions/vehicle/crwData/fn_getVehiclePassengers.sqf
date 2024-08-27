params[
    ["_vehicle",nil,[objNull]]
];
private _startTime = time;
private _driver    = driver    _vehicle;
private _gunner    = gunner    _vehicle;
private _commander = commander _vehicle;
private _crew      = [_driver, _gunner, _commander];
private _men       = crew _vehicle select{!(_x in _crew)};

_men;