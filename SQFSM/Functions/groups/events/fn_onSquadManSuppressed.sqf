params [
    ["_man",          nil,     [objNull]],
    ["_distance",      nil,          [0]],
    ["_shooter",       nil,    [objNull]]
];
private _tooSoon = time - SQFM_lastFireCheck < 2;
if(_tooSoon)exitWith{};

private _group = group _man;
private _data  = _group call getData;
if(isNil "_data")exitWith{};

private _tooSoon = time - (_data get "lastFireCheck") < 5;
if(_tooSoon)               exitWith{};
_data set ["lastFireCheck", time];
SQFM_lastFireCheck = time;

if(_data call ["inBattle"])exitWith{};

private _enemyGrp = group _shooter;
private _valid    = [_group] call SQFM_fnc_validGroup && {[_enemyGrp] call SQFM_fnc_validGroup};
if!(_valid)exitWith{};

[_group, _shooter] call SQFM_fnc_onEnemyDetected;