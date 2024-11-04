params[
    ["_group",          nil,[grpNull]],
    ["_coverPositions", nil,     [[]]]
];
private _self          = _group call getData;
private _leader        = leader _group;
private _leaderPos     = getPosATLVisual _leader;
private _pos           = if(alive _leader)then{_leaderPos}else{_self call ["getAvgPos"]};
private _positions     = [_pos, _coverPositions] call SQFM_fnc_sortInfantryIdlePositions;
private _men           = _self call ["getUnitsOnfoot"];
private _p             = 0;
private _group         = _self get "grp";
private _manCount      = count _men;
private _posIndexCount = count _positions-1;
private _menIndexCount = count _men-1;
private _scripts       = [];

_self set  ["action", "Moving to cover"];
_self set  ["state",  "Guarding Objective"];
_self call ["flashAction",["Moving men to cover"]];

_self call ["toggleExternalAi",[false]];

for "_i" from 0 to _menIndexCount do
{
    private _man      = _men#_i;
    private _pos      = _positions#_p;
    private _distance = _man distance2D _pos;
    private _timeLimit = _distance+30;
    private _scr  = [
        _man, 
        _pos, 
        _timeLimit, 
        3,
        [_man, {doStop _this}]
    ] spawn SQFM_fnc_fsmMoveManToPos;

    _scripts pushBack _scr;

    _p=_p+1;
    if(_p > _posIndexCount)then{_p=0};
};
sleep 3;

{waitUntil {scriptDone _x}}                 forEach _scripts;

_self call ["toggleExternalAi",[true]];
_self set  ["action", "In cover -Guarding Objective-"];
_self set  ["lastActionTime", ceil time];
_self call ["flashAction",["Move complete"]];

true;