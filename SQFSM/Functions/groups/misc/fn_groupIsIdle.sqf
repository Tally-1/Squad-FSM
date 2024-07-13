if (_self call ["activeWp"])         exitWith{false;};
if (_self call ["isTraveling"])      exitWith{false;};
if (_self call ["inBattle"])         exitWith{false;};
if (_self call ["sinceBattle"] < 10) exitWith{false;};
if (_self call ["hasTask"])          exitWith{false};
if!(_self get "available")           exitWith{false;};

if(_self call ["sinceSpawn"] < 20
&&{time > 20})exitWith{false;};

private _objective = _self get "objective";
if!(isNull _objective)
exitWith{false;};

private _transportVehicle = _self get "transportVehicle";
if!(isNull _transportVehicle)
exitWith{false;};

true;