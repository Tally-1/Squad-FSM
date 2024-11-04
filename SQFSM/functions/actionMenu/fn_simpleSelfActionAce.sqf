params [
    ["_player",     nil, [objNull]], // The object to which the action will be attached 
    ["_title",      nil,      [""]], // Title shown on screen
    ["_code",       nil,      [{}]], // Code executed on action
    ["_condition", {true}, ["",{}]], // Code (string=vanilla action-call)
    ["_icon",      "",        [""]], // procedural texture or URL to PAA
    ["_category",  "",        [""]]  // sub-category where the action is placed
];

private _stringCondition = typeName _condition isEqualTo "STRING";
if(_stringCondition)then{
    _condition = compile(_condition regexReplace ["_this", "_player"]);
};

if(_category isEqualTo "")
then{_category = [_player] call SQFM_fnc_selfActionCategoryACE};

private _parentPath = ["ACE_SelfActions", _category];
private _actionType = 1;
private _actionName = ["SQFSM_baseCategoryACE", _title]joinString"";

private _action = [
	_actionName,
	_title,
	_icon,
	_code,
	_condition
] call ace_interact_menu_fnc_createAction;

[
	_player,
	_actionType,
	_parentPath,
	_action

] call ace_interact_menu_fnc_addActionToObject;

[_parentPath, _actionName];