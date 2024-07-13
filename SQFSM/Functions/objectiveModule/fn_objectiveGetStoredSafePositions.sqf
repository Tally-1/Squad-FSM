params[
    ["_side",          nil, [west]],
    ["_startPos",      nil,   [[]]]
];
private ["_safePositions"];
isNil{
    private _query = [_side, _startPos];
    private _match = ((_self get "safePosSearches") select{[_query, _x] call SQFM_fnc_objectiveSafeposMatch})#0;
    if(isNil "_match")exitWith{"No match"call dbgm};

    _safePositions = _match#3;
};

if(isNil "_safePositions")exitWith{};

_safePositions;