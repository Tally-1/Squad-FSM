params [
    ["_man",nil,[objNull]]
];

private _startPos = eyepos _man;
private _endPos = getPosWorld _man vectorAdd [0, 0, 5];
private _objs = lineIntersectsWith [_startPos, _endPos, _man, objNull, true];
if(_objs isEqualTo [])exitWith{objNull};

private _house = _objs#0;

if(count _objs isEqualTo 1
&& {_house isKindOf "house"})
exitWith{_house};

{
  if(_x isKindOf "house")
  exitWith{_house = _x};
  
} forEach _objs;

if!(_house isKindOf "house")exitWith{objNull};

_house;