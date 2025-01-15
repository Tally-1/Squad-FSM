params[
    ["_targetPos", nil,      [[]]],
    ["_rounds",    nil,       [0]],
    ["_spread",    nil,    [true]],
    ["_wait",      nil,    [true]],
    ["_caller",    nil, [grpNull]]
];
private _artys    = _self call ["artilleryPieces",[true]];
private _shooter  = (_artys select {[_x, _targetPos] call SQFM_fnc_artilleryCanFireOnPos;true})#0;
if(isNil "_shooter")exitWith{"no avail grp-arty" call dbgm};

if(SQFM_artySpread < 20) then{_spread = false};

private _ammoData  = [_shooter, true] call SQFM_fnc_artilleryAmmoData;
private _magazine  = (_ammoData)#1#0 get "name";
private _maxCount  = (_ammoData)#0 get _magazine;
private _roundsOut = [_rounds, _maxCount] call SQFM_fnc_artilleryGetRoundCount;

_shooter setVariable ["SQFM_artyCaller", _caller, true];

if(!_spread)exitWith{ 
    [_shooter, [_targetPos], _magazine, _roundsOut, _wait] call SQFM_fnc_artilleryFireOnPos;
};

private _posArr = [_targetPos, _shooter, _magazine] call SQFM_fnc_artilleryTargetPosArr;
[_shooter, _posArr, _magazine, _roundsOut, _wait]   call SQFM_fnc_artilleryFireOnPos;

true;