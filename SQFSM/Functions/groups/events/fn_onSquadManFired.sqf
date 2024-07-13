params [
    ["_man", nil, [objNull]]
];
if(_man in allPlayers)exitWith{};

private _tooSoon = time - SQFM_lastFireCheck < 2;
if(_tooSoon)exitWith{};
SQFM_lastFireCheck = time;

private _group = group _man;
private _data  = _group call getData;
_tooSoon       = time - (_data get "lastFireCheck") < 5;
if(_tooSoon)exitWith{};
_data set ["lastFireCheck", time];


if(_data call ["inBattle"])exitWith{};

private _enemy = getAttackTarget _man;
private _valid = [_enemy] call SQFM_fnc_validLandEntity;
if!(_valid)exitWith{};

private _hostile = [_man, _enemy] call SQFM_fnc_hostile;
if!(_hostile)exitWith{};

[_group, _enemy] call SQFM_fnc_onEnemyDetected;

true;