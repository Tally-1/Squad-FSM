params [
	["_group", nil, [grpNull]],
	["_enemy", nil, [objNull]]
];

// AT-support may be called through this function.
_this call SQFM_fnc_handleArmorSpotted;

// Soldier FSM handles battle-init if activated.
if(SQFM_soldierFsmOn)                     exitWith{};
if!(side _group in SQFM_validSides)       exitWith{};
if!(side _enemy in SQFM_validSides)       exitWith{};
if!(side group _enemy in SQFM_validSides) exitWith{};
if (group _enemy isEqualTo _group)        exitWith{};

private _enemyGroup  = group _enemy;
private _spotterData = _group      call getData;
private _enemyData   = _enemyGroup call getData;

if (isNil "_spotterData")                  exitWith{};
if (isNil "_enemyData")                    exitWith{};
if!(_spotterData call ["canInitBattle"])   exitWith{};
if!(_enemyData   call ["canInitBattle"])   exitWith{};

private _man    = [_group]       call SQFM_fnc_firstValidGroupMember;
private _enemy  = [_enemyGroup]  call SQFM_fnc_firstValidGroupMember;
private _midPos = [_man, _enemy] call SQFM_fnc_getMidpoint;

if([_midPos] call SQFM_fnc_posInBattleZone)     exitWith{};
if(_enemy distance2D _man > SQFM_maxBattleSize) exitWith{};
if(_group knowsAbout _enemy < 4)                exitWith{};

[_man, _enemy] call SQFM_fnc_initBattle;

true;