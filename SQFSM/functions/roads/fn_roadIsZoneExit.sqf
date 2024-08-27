params[
    ["_pos",  nil,            [[]]], // Center of zone 
    ["_rad",  nil,             [0]], // Zone radius
    ["_road", nil, [createHashmap]]  // Hashmaps extracted by using SQFM_fnc_getRoadData on a roadsegment.
];
private _validTypes = ["ROAD", "MAIN ROAD", "TRACK"];
private _thisType   = _road get "type";
if!(_thisType in _validTypes)exitWith{false};

private _connecters   = _road get "connected";
private _outLiers     = _connecters select {(getpos _x distance2D _pos)>_rad};

if(_outLiers isEqualTo _connecters) exitWith{false};
if(_outLiers isEqualTo [])          exitWith{false};
if(count _outLiers > 1)             exitWith{false};

// find out if the next segment connected to the road is back inside the zone.
// private _all      = [_road get "segment", _connecters];
// private _outLier1 = _outLiers#0;
// private _insiders = roadsConnectedTo _outLier1 select{(!(_x in _all)) && {_x distance _pos < _rad}};
// if(_outLiers isNotEqualTo [])exitWith{false};

true;