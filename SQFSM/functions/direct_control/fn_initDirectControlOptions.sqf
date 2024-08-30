params [
    ["_entity",nil,[objNull]]
];

private _valid = [_entity] call SQFM_fnc_validSwitchEntity;
private _timer = time+3;
if!(_valid)exitWith{};

SQFM_currentEditObject = _entity;
private _display = (allDisplays select {[_x] call SQFM_fnc_isCuratorEntityMenuDisplay})#0;
if(isNil "_display")exitWith{};

// CBA keybind is used.
if((!isNil "SQFM_clickDc")
&&{SQFM_clickDc})
exitWith{
    _display closeDisplay 1;
    [_entity] call SQFM_fnc_switchUnit_Start;
};

uiNamespace setVariable ["SQFM_currentEditDisplay", _display];
[_display] call SQFM_fnc_addCuratorControlEntityButton;

true;