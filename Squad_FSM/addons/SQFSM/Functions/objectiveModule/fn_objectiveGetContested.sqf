private _inBattle = _self call ["inBattle"];
if(_inBattle)exitWith{true;};

private _sideCount = count(_self call ["getSidesInZone"]);
if(_sideCount > 1)exitWith{true;};

false;