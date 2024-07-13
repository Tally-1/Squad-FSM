params[
    ["_time",          nil,    [0]],
    ["_side",          nil, [west]],
    ["_startPos",      nil,   [[]]],
    ["_safePositions", nil,   [[]]]
];
private _searchEntry = [_time, _side, _startPos, _safePositions];
(_self get "safePosSearches") pushBack _searchEntry;

_self call ["removeSafePosSearches"];

true;