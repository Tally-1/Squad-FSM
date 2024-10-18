params[
    ["_objectives",nil,[[]]],
    ["_map",nil,[controlNull]]
];
if(_objectives isEqualTo [])
exitWith{SQFM_currentMapObjective = objNull};


private _mousePosMap      = _map ctrlMapScreenToWorld getMousePosition;
private _nearest          = [_mousePosMap, _objectives]call SQFM_fnc_getNearest;
if(isNil "_nearest")
exitWith{SQFM_currentMapObjective = objNull};

private _curObjective     = SQFM_currentMapObjective;
private _mousePosScreen   = getMousePosition;
private _nearestPosScreen = (_map ctrlMapWorldToScreen getPosASL _nearest);
private _mouseOver        = _nearestPosScreen distance2D _mousePosScreen < 0.03;


if(_mouseOver)
then{SQFM_currentMapObjective = _nearest}
else{SQFM_currentMapObjective = objNull};

private _focusChanged = _curObjective isNotEqualTo SQFM_currentMapObjective;
if(_focusChanged)
then{call SQFM_fnc_objectiveMapFocusChanged};

true;