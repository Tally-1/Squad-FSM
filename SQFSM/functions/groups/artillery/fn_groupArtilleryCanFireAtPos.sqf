params[
    ["_targetPos", nil,   [[]]]
];
private _artys     = _self call ["artilleryPieces",[true]];
if(_artys isEqualTo [])exitWith{false};

private _available = _artys select {[_x, _targetPos] call SQFM_fnc_artilleryCanFireOnPos};
if(_available isEqualTo [])exitWith{false};

true;