private _group = _self get "grp";
if (_group getVariable ["SQFM_Excluded",false]) exitWith{"Group excluded by variable"};
if (_self get "awaitingReforce")                exitWith{"Waiting for reinforcments"};
if (_self get "awaitingReplenish")              exitWith{"Waiting to be replenished"};
if (_self call ["hasTask"])                     exitWith{"Has Task"};
if (_self call ["activeWp"])                    exitWith{"Has waypoint"};
if (_self call ["isTraveling"])                 exitWith{"Traveling"};
if!(_self call ["isValid"])                     exitWith{"Group disabled, invalid or empty"};
if (_self call ["sinceSpawn"]  < 10)            exitWith{"Just spawned"};
if (_self call["isPlayerGroup"])                exitWith{"Playergroup"};

"Available";