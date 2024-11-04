params[
    ["_man",    nil, [objNull]],
    ["_enable", nil,    [true]]
];
_man setVariable ["lambs_danger_disableAI", !_enable, true];

// if unitdata is not present then it is no point in excluding
private _unitData = _man getVariable "SFSM_UnitData";
if(isNil "_unitData")exitWith{};

_man setVariable ["SFSM_Excluded", !_enable, true];

true;