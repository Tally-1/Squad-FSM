private _inIdleState = "idle" in (_self get "state");
private _validWp     = (_self call ["activeWp"])&&{_inIdleState isEqualTo false};
// private _timeIsNow   = { _self set ["lastActionTime",round time]; false;};

if (_validWp)                        exitWith { _self set ["lastActionTime",round time]; false;};
if (_self call ["isTraveling"])      exitWith { _self set ["lastActionTime",round time]; false;};
if (_self call ["inBattle"])         exitWith { _self set ["lastActionTime",round time]; false;};
if (_self call ["sinceBattle"] < 10) exitWith { _self set ["lastActionTime",round time]; false;};
if (_self call ["hasTask"])          exitWith { _self set ["lastActionTime",round time]; false;};
if!(_self get "available")           exitWith { _self set ["lastActionTime",round time]; false;};

true;