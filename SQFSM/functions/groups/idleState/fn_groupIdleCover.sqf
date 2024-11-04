private _self          = _this;
private _group         = _self get "grp";
private _leader        = leader _group;
private _validLeader   = [_leader] call SQFM_fnc_validMan;
private _leaderPos     = getPosATLVisual _leader;
private _squadPos      = _self call ["getAvgPos"];
private _pos           = if(_validLeader)then{_leaderPos}else{_squadPos};
private _rad           = 75;
private _positions     = [_pos,_rad] call SQFM_fnc_nearInfantryIdlePositions;
private _men           = _self call ["getUnitsOnfoot"];
private _p             = 0;
private _manCount      = count _men;
private _posIndexCount = count _positions-1;
private _menIndexCount = count _men-1;
private _scripts       = [];

if(_positions isEqualTo []) exitWith{false};
if(_men isEqualTo [])       exitWith{false};

_self set  ["action", "Taking idle cover"];
_self set  ["state",  "Taking idle cover"];
_self call ["flashAction",["Moving men to cover"]];

for "_i" from 0 to _menIndexCount do
{
    private _man  = _men#_i;
    private _pos  = _positions#_p;
    private _scr  = [_man, _pos] spawn SQFM_fnc_sendManToIdleCover;

    _scripts pushBack _scr;

    _p=_p+1;
    if(_p > _posIndexCount)then{_p=0};
};
sleep 3;

{waitUntil {scriptDone _x}} forEach _scripts;

_self call ["flashAction",["Idle cover move ended"]];
_self call ["toggleExternalAi",[true]];

true;