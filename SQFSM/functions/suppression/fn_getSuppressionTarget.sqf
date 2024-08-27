params[ 
    ["_entity",    nil, [objNull]], // Man or vehicle whos known targets will be used.
    ["_target",    nil, [objNull]], // the target being queried
    ["_knownOnly", nil,    [true]]  // if knowledge is required to return the object.
];
if(_knownOnly
&&{_entity knowsAbout _target < 3.5})
exitWith{};

private _inValid = !([_entity, _target] call SQFM_fnc_hostile); //([_entity, _target] call SQFM_fnc_validEnemy);
if(_inValid)exitWith{};

private _startPos   = eyePos _entity;
private _endPos     = eyePos _target;
private _building   = [_target] call SQFM_fnc_manCurrentBuilding;
private _fortified  = (!isNil "_building")&&{!isNull _building};
private _ignoreList = [];

{_ignoreList pushBackUnique vehicle _x} forEach (units group _entity);
{_ignoreList pushBackUnique vehicle _x} forEach (units group _target);

if(_fortified)then{ 
    _endPos = [_startPos, _building] call SQFM_fnc_getBuildingSuppressionPos;
    _target = _building;
};

private _visible    = !([_startPos, _endPos, _ignoreList] call SQFM_fnc_lineBroken);
if(_visible)   exitWith{_target};
if(_fortified) exitWith{}; // Exits if the target is inside a building, and there is no LOS on the building.

private _targetPos = [_entity, _target, _ignoreList] call SQFM_fnc_getSuppressionTargetPosition;
if(isNil "_targetPos")exitWith{};

_targetPos;