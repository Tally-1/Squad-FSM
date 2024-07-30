params[
    ["_building", nil, [objNull]],
    ["_retry",    nil,   [false]]
];
private _positions = _building buildingPos -1;
private _men       = _self call ["getUnitsOnfoot"];
if(_positions isEqualTo []) exitWith{false};
if(_men isEqualTo [])       exitWith{false};

private _p             = 0;
private _group         = _self get "grp";
private _manCount      = count _men;
private _posIndexCount = count _positions-1;
private _menIndexCount = count _men-1;
private _scripts       = [];
private _movingIn      = _building getVariable ["SQFM_movingIn",0];



_positions = [_positions, [],{_x#2}, "DESCEND"] call BIS_fnc_sortBy;
_building setVariable ["SQFM_movingIn", _movingIn+_manCount];
_self call ["flashAction",["Grrs"]];
_self set ["action","getting inside Building"];
_group enableAttack false;

for "_i" from 0 to _menIndexCount do
{
    private _man  = _men#_i;
    private _pos  = _positions#_p;
    private _scr  = [_man, _building, _pos] spawn SQFM_fnc_garrisonMan;

    _scripts pushBack _scr;

    _p=_p+1;
    if(_p > _posIndexCount)then{_p=0};
};
sleep 3;

{waitUntil {scriptDone _x}} forEach _scripts;
_self set ["action",""];

_movingIn = _building getVariable "SQFM_movingIn";
_building setVariable ["SQFM_movingIn", _movingIn-_manCount];

private _success    = true;
private _buildings  = _men apply {[_x] call SQFM_fnc_manGetBuilding};
private _nearestMan = [_building, _men] call SQFM_fnc_getNearest;
private _distance   = _nearestMan distance2D _building;
private _away       = _distance > 5;

if((!(_building in _buildings))
&&{_away})
then{_success = false};

private _repeat = _retry && {!(_success)};

if(_repeat)exitWith{
    _self call ["getInBuilding",[_target, false]];
};

_group enableAttack true;

{
    private _thisBld = [_x] call SQFM_fnc_manGetBuilding;
    if(_building != _thisBld)
    then{_x doFollow leader _group};

} forEach _men;

if!(_success)exitWith{false};

true;