params[
    ["_man",       nil,[objNull]],
    ["_positions", nil,     [[]]],
    ["_leaderPos", nil,     [[]]]
];
if(_positions isEqualTo [])exitWith{};

private ["_movePos"];
private _sortedPos = [_man, _positions] call SQFM_fnc_sortByDist;

{
    if(!isNil "_movePos")exitWith{};
    private _valid = [_x] call SQFM_fnc_clearPos;
    if(_valid)exitWith{_movePos = _x};

} forEach _sortedPos;

if(isNil "_movePos")then{_movePos = _leaderPos};

_man setVariable ["SQFM_Regrouped",false];

private _SFSMflash = (!isNil "SFSM_fnc_flashAction")&&{!isNil "SFSM_debugger"&&{SFSM_debugger}};
private _dist      = _man distance _movePos;
private _endCode   = [_man, {_this setVariable ["SQFM_Regrouped", true]}];
private _time      = _dist+30;

// [
//     _man, 
//     _movePos, 
//     _time, 
//     3,
//     _endCode
// ] spawn SQFM_fnc_fsmMoveManToPos;

[
    _man,
    30,
    _movePos, 
    _time, 
    3,
    _endCode
] spawn SQFM_fnc_manWaitThenMoveIfAvailable;
 
// SQFM_Custom3Dpositions pushBackUnique [_movePos, name _man, [0,1,0,1]];

if(_SFSMflash)
then{[_man, "Regrouping (Squad FSM)"] spawn SFSM_fnc_flashAction}
else{[_man, "Regrouping"] spawn SQFM_fnc_flashActionMan};

_movePos;