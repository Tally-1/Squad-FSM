params[
    ["_query", nil, [[]]], // Should be: [side, pos]
    ["_entry", nil, [[]]]  // Entry to be evaluated [time,side,pos,[results]]
];
private _querySide  = _query#0;
private _queryPos   = _query#1;
private _entrySide  = _entry#1;
private _entryPos   = _entry#2;
private _objPos     = _self get "position";
private _queryDir   = _objPos getDir _queryPos;
private _entryDir   = _objPos getDir _entryPos;
private _sidesMatch = _entrySide isEqualTo _querySide;
private _dirsMatch  = [_queryDir, _entryDir, 20] call SQFM_fnc_inDirRange;

if!(_sidesMatch) exitWith{false;};
if!(_dirsMatch)  exitWith{false;};

true;