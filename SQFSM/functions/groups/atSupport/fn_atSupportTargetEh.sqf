params[
    ["_target",nil,[objNull]]
];
private _eh = _target getVariable "SQFM_atSupportTargetEh";
if(!isNil "_eh")exitWith{};

_eh = 
_target addEventHandler ["Hit", {
	params ["_target", "_source", "_damage", "_instigator"];
    if([_target] call SQFM_fnc_validAtTarget)exitWith{};
    private _hunterGrps = _target getVariable ["SQFM_hunterGrps", []];
    {
        private _taskData = (_x call getData)call ["getTaskData"];
        if(str _taskData isNotEqualTo "[]")
        then{_taskData call["endTask"]};
        
    } forEach _hunterGrps;
    _target removeEventHandler [_thisEvent, _thisEventHandler]; 
}];

_target setVariable ["SQFM_atSupportTargetEh", _eh];

_eh;