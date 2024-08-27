params[
    ["_vehicle",   nil,[objNull]],
    ["_men",       nil,     [[]]],
    ["_menDelay",    0,      [0]],
    ["_waitForMen",nil,   [true]]
];
private _group  = group (_men#0);
private _driver = driver _vehicle;

_group enableAttack true;
_driver enableAI "path";

if(_waitForMen)
then{[_men,_menDelay]call SQFM_fnc_mechUnloadActivateMen}
else{[_men,_menDelay]spawn SQFM_fnc_mechUnloadActivateMen};


_vehicle setVariable ["SQFM_mechUnloading",true,true];

_vehicle setVariable ["SQFM_mechUnloading",false,true];

true;