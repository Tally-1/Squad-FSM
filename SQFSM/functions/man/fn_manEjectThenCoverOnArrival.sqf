params [
    ["_man", nil, [objNull]]
];

[_man, "Covering"] spawn SQFM_fnc_flashActionMan;

_man disableAI "path";
_man setUnitPos "MIDDLE";

private _target = _man getVariable "SQFM_suppressionTarget";
if(isNil "_target")exitWith{};

if(typeName _target isEqualTo "OBJECT"
&&{_target isKindOf "house"})
then{_target = [aimPos _man, _building] call SQFM_fnc_getBuildingSuppressionPos};

_man doSuppressiveFire _target;

true;