if!(_self get "canHunt")             exitWith{false};
if (_self get "huntCoolDown" > time) exitWith{false};
if (_self call ["hasTask"])          exitWith{false};
if (_self call ["activeWp"])         exitWith{false};
if (_self call ["isTraveling"])      exitWith{false};
if (_self call ["sinceSpawn"]  < 30) exitWith{false};


true;