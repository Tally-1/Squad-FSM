private _artilleryPieces = _self call ["artilleryPieces",[true]];
private _readyToFire     = _artilleryPieces isNotEqualTo [];
if(_readyToFire)exitWith{true};

false;