params[
    ["_startPos",  nil,     [[]]],
	["_objModule", nil,[objNull]]
];
private ["_insPos"];
private _objData    = _objModule call getData;
private _objPos     = (_objData get "zone")#0;
private _objRad     = (_objData get "zone")#1;
private _halfRad    = _objRad/2;
private _direction  = _objPos getDir _startPos;
private _extraRad   = _halfRad;

if(_extraRad > 100)then{_extraRad = 100};

// Yes, not the most readable. In short the following lines gets an array of positions in a cone shape.
// The positions are sorted by distance to the startpos.
private _positions = [_startPos, ([
        _objPos,
        _objRad+_extraRad,
        _direction,
        135,
        _halfRad,
        30
] call SQFM_fnc_zoneCone)] call SQFM_fnc_sortByDist;

// SQFM_Custom3Dpositions = _positions apply {[_x, "", [0,1,0,0.5]]};

{
    if(!isNil "_insPos")exitWith{};

    private _clear = [_x] call SQFM_fnc_clearPos;
    if(_clear)exitWith{_insPos = _x};

} forEach _positions;

if(isNil "_insPos")exitWith{_objPos};

_insPos;