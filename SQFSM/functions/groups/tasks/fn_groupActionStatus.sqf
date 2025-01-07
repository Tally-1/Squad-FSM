private _group    = _self get "grp";
private _coolDown = SQFM_spawnCooldown;
if (_group getVariable ["SQFM_Excluded",false]) exitWith{"Group excluded"};
if (_self get "awaitingReforce")                exitWith{"Waiting for reinforcments"};
if (_self get "awaitingReplenish")              exitWith{"Waiting to be replenished"};
if (_self get "regrouping")                     exitWith{"Regrouping"};
if (_self call ["hasTask"])                     exitWith{"Has Task"};
if (_self call ["activeWp"])                    exitWith{"Has waypoint"};
if (_self call ["isTraveling"])                 exitWith{"Traveling"};
if!(_self call ["isValid"])                     exitWith{"Group disabled, invalid or empty"};
if (_self call ["sinceSpawn"]< _coolDown)       exitWith{"Just spawned"};
if (_self call["isPlayerGroup"])                exitWith{"Playergroup"};
if (_self call ["inBattle"])                    exitWith{"In battle"};

"Available";