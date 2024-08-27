params[
    ["_vehicle",   nil,[objNull]],
    ["_men",       nil,     [[]]],
    ["_positions", nil,     [[]]],
    ["_timeLimit", nil,      [0]]
];
private _endIndex = count _positions;
private _group    = group (_men#0);
private _driver   = driver _vehicle;

_group enableAttack false;
_driver disableAI "path";
_vehicle setVariable ["SQFM_mechUnloading",true,true];

{
    if(_foreachIndex >= _endIndex)exitWith{};

    private _pos = _positions#_foreachIndex;
    [_x, _vehicle, _pos, _timeLimit] spawn SQFM_fnc_manEjectThenCover;
    _x setVariable ["SFSM_Excluded",true,true];
    _x setAnimSpeedCoef 1.2;
    
} forEach _men;

waitUntil { 
    sleep 1;
    private _movers     = _men select {currentCommand _x isNotEqualTo "" || {vehicle _x isEqualTo _vehicle}};
    private _groupReady = _movers isEqualTo [];
    _groupReady || {time > _timeLimit};
};

[["Mech unloaded ",count _men," men in ", round (time-_startTime), " seconds."]] call dbgm;

true;