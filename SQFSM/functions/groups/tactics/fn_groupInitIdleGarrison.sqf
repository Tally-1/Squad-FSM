params[
    ["_takenPositions",[],[[], createHashmap]]
];
if(typeName _takenPositions isEqualTo "HASHMAP")
then{_takenPositions = []};

private _urbanZones = _self call ["getNearUrbanZones",[300]];
if(_urbanZones isEqualTo [])exitWith{};

private _wpPositions = call SQFM_fnc_allWaypointPositions;
_takenPositions insert [0,_wpPositions,true];
private _available   = _urbanZones select { 
    private _pos     = _x get "position";
    private _nearest = [_pos, _takenPositions] call SQFM_fnc_getNearest;
    private _valid   = isNil "_nearest"||{(_pos distance2D _nearest)>20};
    _valid;
};
if(_available isEqualTo [])
then{_available = _urbanZones};

private _grpPos    = _self call ["getAvgPos"];
private _positions = [];
{_positions pushBack (_x get "position")} forEach _available;
private _nearest = [_grpPos,_positions]call SQFM_fnc_getNearest;
_self call ["unStop"];
_self call ["idleGarrison",[_nearest]];

_nearest;