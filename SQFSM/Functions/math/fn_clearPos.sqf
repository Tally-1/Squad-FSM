params[
	["_pos",          nil,      [[]]],
	["_excludeRoads", false, [false]],
	["_safeDistX",    8,         [0]],
	["_safeDistZ",    20,        [0]]
];
if(isNil "_pos")exitWith{false;};
private _xx = _pos#0;

if(isNil "_xx")exitWith{
	(str _this) call dbgm;
	false;
};
if(surfaceIsWater _pos)exitWith{false;};

// FRLI_fnc_distToNearWp
private _groundPos = ATLToASL [_pos#0, _pos#1, 0.1];
private _topPos    = ATLToASL [_pos#0, _pos#1, _safeDistZ];

private _blocked = [_groundPos, _topPos] call SQFM_fnc_lineBroken;
if(_blocked)exitWith{false;};

private _nearObj = nearestTerrainObjects [_pos, ["BUILDING", "HOUSE", "ROCK", "ROCKS", "TREE"], _safeDistX]; 
if(count _nearObj > 0)exitWith{false;};

_nearObj = _pos nearObjects ["land", _safeDistX];
if(count _nearObj > 0)exitWith{false;};


private _nearRoads = _pos nearRoads _safeDistX;
if((count _nearRoads > 0) isEqualTo true
&&{_excludeRoads          isEqualTo true})
exitWith{false;};


true;