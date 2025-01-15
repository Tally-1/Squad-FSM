private _enemies = _self call ["nearKnownEnemies",[600]] select {speed _x < 15};
if(_enemies isEqualTo [])exitWith{false};

private _positions = _self call ["artilleryStrikePositions",[_enemies]];
if(_positions isEqualTo [])exitWith{false};

private _targetPos = _positions#0;
_self call ["requestArtillery",[_targetPos]];

true;