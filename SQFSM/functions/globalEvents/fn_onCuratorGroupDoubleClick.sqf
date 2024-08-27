params [
    ["_curator",    nil, [objNull]],
    ["_group",      nil, [grpNull]]
];
private _display = allDisplays#4;
private _button  = [_display] call SQFM_fnc_addCuratorGroupMenuButton;

SQFM_currentEditSquad   = _group;
uiNamespace setVariable ["SQFM_currentEditDisplay", _display];

_button ctrlAddEventHandler ["ButtonClick", {_this call SQFM_fnc_openCuratorSquadMenu}];

// call SQFM_fnc_openCuratorSquadMenu;

true;