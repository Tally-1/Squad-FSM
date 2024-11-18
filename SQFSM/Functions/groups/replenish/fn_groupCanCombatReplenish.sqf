params[
    ["_excluded",nil,[[]]]
];
private _group = _self get "grp";
if(_group in _excluded)exitWith{false};

private _needed = _self call ["needsCombatReplenish"];
if!(_needed)exitWith{false};

private _canReplenish = _self call ["canReplenish"];
if!(_canReplenish)exitWith{false};

private _strTask = str(_self call ["getTaskData"]);
if(_strTask isNotEqualTo "[]")exitWith{false};

private _battle = _self call ["getBattle"];
if(isNil "_battle")exitWith{false};

if(_self call["isPlayerGroup"])exitWith{false};

true;