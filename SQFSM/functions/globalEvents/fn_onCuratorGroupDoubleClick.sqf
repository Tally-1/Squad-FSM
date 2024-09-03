params [
    ["_curator",    nil, [objNull]],
    ["_group",      nil, [grpNull]]
];
private _timer = time+3;
waitUntil {dialog || {time > _timer}};

private _display = (allDisplays select {[_x] call SQFM_fnc_isCuratorGroupMenuDisplay})#0;
if(isNil "_display")exitWith{};

private _button  = [_display] call SQFM_fnc_addCuratorGroupMenuButton;

SQFM_currentEditSquad   = _group;
uiNamespace setVariable ["SQFM_currentEditDisplay", _display];

_button ctrlAddEventHandler ["ButtonClick", {_this call SQFM_fnc_openCuratorSquadMenu}];

// call SQFM_fnc_openCuratorSquadMenu;

true;