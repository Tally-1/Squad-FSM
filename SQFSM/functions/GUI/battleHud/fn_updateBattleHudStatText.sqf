params[
    ["_battle",nil,[createHashmap]]
];

private _strengthEast = [_battle, east]        call SQFM_fnc_getBattleStrength; // if!(east in _sides)        then{0}else{_strengthData call ["friendlyStrength",[east]]};
private _strengthGuer = [_battle, independent] call SQFM_fnc_getBattleStrength; // if!(independent in _sides) then{0}else{_strengthData call ["friendlyStrength",[independent]]};
private _strengthWest = [_battle, west]        call SQFM_fnc_getBattleStrength; // if!(west in _sides)        then{0}else{_strengthData call ["friendlyStrength",[west]]};

if(isNil "_strengthEast")exitWith{};

_self call ["setValues", [
    _strengthEast, 
    _strengthGuer,
    _strengthWest
]];