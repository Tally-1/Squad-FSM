params [
	["_man",    nil, [objNull]], 
	["_target", nil, [objNull]]
];
private _posA     = ([_man] call SQFM_fnc_cluster)    get "position";
private _posB     = ([_target] call SQFM_fnc_cluster) get "position";
private _distance = _posA distance2D _posB;
private _midPoint = [_posA, _posB, true] call SQFM_fnc_getMidpoint;
private _nearObj  = [_midPoint] call SQFM_fnc_nearestObjective;
if(isNil "_nearObj")exitWith{_midPoint};

private _objData = _nearObj call getData;
private _objPos  = _objData get "position";
private _objRad  = (_objData get "zone")#1;

if((_nearObj distance2D _midPoint) > _objRad) exitWith{_midPoint};

private _groupA        = group _man;
private _groupB        = group _target;
private _zone          = [_objPos, _objRad+300];
private _objGroups     = _zone call SQFM_fnc_groupsInZone;
private _midPosPresent = _midPoint distance2D _objPos < _objRad;

_objPos = [_objPos#0,_objPos#1, 10];

// if both groups are inside the objective
if(_groupA in _objGroups
&&{_groupB in _objGroups})
exitWith{_objPos};

// if one group is inside the objective, and the middle position also is inside the objective
if((_groupA in _objGroups
||{_groupB in _objGroups})
&&{_midPosPresent})
exitWith{_objPos};

_midPoint;