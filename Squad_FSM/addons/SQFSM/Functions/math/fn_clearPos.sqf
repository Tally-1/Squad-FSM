params[
	"_pos", 
	["_excludeRoads",    false],
	["_safeDistX",           8],
	["_safeDistZ",          20]
];
if(isNil "_pos")exitWith{false;};
private _xx = _pos#0;

if(isNil "_xx")exitWith{
	(str _this) call dbgm;
	false;
};

// FRLI_fnc_distToNearWp
private _groundPos = ATLToASL [_pos#0, _pos#1, 0.1];
private _topPos    = ATLToASL [_pos#0, _pos#1, _safeDistZ];

private _blocked = [objNull, "VIEW"] checkVisibility [_groundPos, _topPos] < 1;
if(_blocked)exitWith{false;};

private _nearObj = nearestTerrainObjects [_pos, ["BUILDING", "HOUSE", "ROCK", "ROCKS", "TREE", "ROAD"], _safeDistX]; 
if(count _nearObj > 0)exitWith{false;};

_nearObj = _pos nearObjects ["land", _safeDistX];
if(count _nearObj > 0)exitWith{false;};


private _nearRoads = _pos nearRoads _safeDistX;
if((count _nearRoads > 0) isEqualTo true
&&{_excludeRoads          isEqualTo true})
exitWith{false;};


true;