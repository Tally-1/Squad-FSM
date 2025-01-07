params [
    ["_group",      nil, [grpNull]],
    ["_leader",     nil, [objNull]],
    ["_men",        nil,      [[]]],
    ["_combatMode", nil,      [""]],
    ["_speedMode", nil,      [""]]
];
private _timer    = time+120;
private _grpData  = _group call getData;
private _taskData = _grpData call ["getTaskData"];

waitUntil {
    sleep 1;
    private _ready = [_men] call SQFM_fnc_menEndedRegroup;
    if(_ready)      exitWith{true};
    if(_timer<time) exitWith{true};
    false;
};

"regrouping ended" call dbgm;

_taskData call ["endTask"];
_grpData  set  ["action",       ""];
_grpData  set  ["regrouping", false];

_group  setCombatMode _combatMode;
_group  setSpeedMode   _speedMode;
_group  enableAttack         true;

_leader enableAI     "PATH";
_leader setUnitPos     "UP";
_leader setUnitPos   "AUTO";

{
    _x enableAI "COVER";
    _x enableAI "FSM";
    _x enableAI "TARGET";
    [_x, true] call SQFM_fnc_manToggleExternalAi;
    _x doFollow _leader;
    _x setAnimSpeedCoef 1;

} forEach _men;
