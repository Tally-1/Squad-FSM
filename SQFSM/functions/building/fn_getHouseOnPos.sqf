params[ 
    ["_pos", nil,[[]]]
];
private _lowPos  = ATLToASL [_pos#0,_pos#1,0.1];
private _highPos = _lowPos vectorAdd [0, 0, 5];
private _objects = lineIntersectsWith [_lowPos, _highPos,objNull,objNull, true];
private _house   = (_objects select{[_x, true, 2]call SQFM_fnc_isHouse})#0;

if(isNil "_house")exitWith{objNull};

_house;