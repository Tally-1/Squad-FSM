params [
    ["_check",true,[true]]
];
if(_self get "regrouping")exitWith{};

private _group      = _self get "grp";
private _leader     = driver vehicle leader _group;
private _leaderPos  = getPosATLVisual _leader;
private _params = [false, false, false, false];
private _men        = (_self call ["getFunctionalMen", _params])select{_x distance2D _leaderPos>SQFM_regroupDistance};
if(_men isEqualTo [])exitWith{};

private _canRegroup = if(_check)then{_self call ["canRegroup",[false, _men]]}else{true};
if(!_canRegroup)exitWith{};

private _combatMode = combatMode _group;
private _speedMode  = speedMode _group;
private _zone       = [_leaderPos, SQFM_regroupDistance];
private _taskData   = ["initTask", ["regrouping", _zone]];
private _positions  = [
        _leaderPos,
        40,
        0,
        359,
        10,
        5
] call SQFM_fnc_zoneCone;

// SQFM_Custom3Dpositions = _positions apply {[_x,""]};

_group  setCombatMode "YELLOW";
_group  enableAttack  false;
_group  setSpeedMode  "FULL";
_leader disableAI     "PATH";
_leader setUnitPos    "DOWN";

_self set ["action", "regrouping"];
_self set ["regrouping", true];

{
    private _newPos = [_x, _positions, _leaderPos] call SQFM_fnc_manRegroupOnLeaderPos;
    private _target = getAttackTarget _x;
	if(!isNull _target)then{
		_x forgetTarget _target;
		_x doWatch objNull;
	};

    _positions deleteAt (_positions find _newPos);
    [_x, false] call SQFM_fnc_manToggleExternalAi;

    _x disableAI "COVER";
    _x disableAI "FSM";
    _x disableAI "TARGET";
    _x setAnimSpeedCoef 1.2;

} forEach _men;

[
    _group,
    _leader,
    _men,
    _combatMode,
    _speedMode
] spawn SQFM_fnc_endRegroup;

true;