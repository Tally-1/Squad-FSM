params[
    ["_strengthData", nil, [createHashmap]],
    ["_strengthBar",  nil, [createHashmap]]
];
// private _strengthBar = _display getVariable "SQFM_HUD"get"strengthBar";

_strengthBar call ["update", [
    (_strengthData call ["sideCoef", [west]]),
    (_strengthData call ["sideCoef", [east]]),
    (_strengthData call ["sideCoef", [independent]])
]];

true;