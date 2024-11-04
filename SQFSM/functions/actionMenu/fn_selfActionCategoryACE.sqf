params[
    ["_player",nil,[objNull]]
];
private _categoryName = "SQFSM_SelfActionsACE";
private _baseCategory = _player getVariable "SQFSM_baseCategoryACE";
if(!isNil "_baseCategory")exitWith{_categoryName;};

private _baseCategory = [
	_categoryName,
	"Squad FSM",
	"",
	{},
	{true}
] call ace_interact_menu_fnc_createAction;

[
	_player,
	1,
	["ACE_SelfActions"],
	_baseCategory

] call ace_interact_menu_fnc_addActionToObject;

_player setVariable ["SQFSM_baseCategoryACE", _categoryName];

_categoryName;