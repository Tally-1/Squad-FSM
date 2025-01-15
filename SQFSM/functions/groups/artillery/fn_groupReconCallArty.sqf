params[
    ["_enemies",nil,[[]]]
];
if(_enemies isEqualTo [])exitWith{false};

_enemies = _enemies select {speed _x < 20};
if(_enemies isEqualTo [])exitWith{false};

private _canCall = _self call ["canRequestArtillery"];
if(!_canCall)exitWith{false};

private _strikePositions = _self call ["artilleryStrikePositions",[_enemies]];
private _noneFound       = _strikePositions isEqualTo [];
if(_noneFound)exitWith{"no recon-arty-strike-pos found" call dbgm; false};

private _targetPos = _strikePositions#0;
_self call ["requestArtillery",[_targetPos]];

"Recon squad calling arty" call dbgm;

_targetPos;