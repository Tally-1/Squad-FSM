params [
	["_group", nil, [grpNull]],
	["_enemy", nil, [objNull]]
];
private _self      = _group call getData;
private _sinceLast = time - (_self get "lastAtCheck");
if(_sinceLast < 10)exitWith{};

_self set ["lastAtCheck",round time];

private _knowledge = _group knowsAbout _enemy;
private _unknown   = _knowledge < 3.9;
if(_unknown)exitWith{};

private _inValid = !([_enemy] call SQFM_fnc_validAtTarget);
if(_inValid)exitWith{};


private _inValid = !(_self call ["isValid"]);
if(_inValid)exitWith{};

private _grpPos      = _self call ["getAvgPos"];
private _distance    = _grpPos distance2D _enemy;
private _maxDistance = 1000; // SQFM_maxRpgRange+100;
if(_distance > _maxDistance)exitWith{};

private _attacking = _self call ["attackArmorOnSight",[_enemy]];
if(_attacking)exitWith{};

_self call ["callAtSupport",[_enemy]];