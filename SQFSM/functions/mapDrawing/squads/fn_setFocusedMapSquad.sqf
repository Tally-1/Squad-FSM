params[
    ["_squads", nil,          [[]]],
    ["_map",    nil, [controlNull]]
];
if(_squads isEqualTo [])             exitWith{SQFM_currentMapSquad = grpNull};
if(!isNull SQFM_currentMapObjective) exitWith{SQFM_currentMapSquad = grpNull};

private _positions   = _squads apply {(_x call getData) call ["getAvgPos"]};
private _mousePosMap = _map ctrlMapScreenToWorld getMousePosition;
private _nearest     = [_mousePosMap, _positions]call SQFM_fnc_getNearest;
if(isNil "_nearest")exitWith{SQFM_currentMapSquad = grpNull};

private _currentSquad     = SQFM_currentMapSquad;
private _mousePosScreen   = getMousePosition;
private _nearestPosScreen = (_map ctrlMapWorldToScreen _nearest);
private _mouseOver        = _nearestPosScreen distance2D _mousePosScreen < 0.03;

if!(_mouseOver)exitWith{SQFM_currentMapSquad = grpNull};
private _index      = _positions find _nearest;
private _mouseSquad = _squads#_index;

SQFM_currentMapSquad = _mouseSquad;

private _focusChanged = _currentSquad isNotEqualTo SQFM_currentMapSquad;
if(_focusChanged)
then{call SQFM_fnc_squadMapFocusChanged};

true;