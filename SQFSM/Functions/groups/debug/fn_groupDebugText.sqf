#include "..\..\misc\textIncludes.sqf";
private _group          = _self get "grp";
private _man            = [_group] call SQFM_fnc_firstValidGroupMember;
private _groupName      = str _group;
private _title          = [_bigTxt,_aqua, _groupName, _end,_end]joinString"";
private _action         = _self get "action";
private _actionStatus   = _self call ["actionStatus"];
private _strength       = _self call ["getStrength"];
private _strengthI      = _self get "initialStrength";
private _battleTask     = _self get "battleTask";
private _actionText     = [_subCategoryTitle, "Action: ", _end, _subCategoryText,  (_self get "action"), _end]joinString"";
private _stateText      = [_subCategoryTitle, "State: ", _end, _subCategoryText,  (_self get "state"), _end]joinString"";
private _idleText       = _self call ["debugIdleText"];
private _statusText     = [_subCategoryTitle, "Task-Status: ", _end, _subCategoryText,  _actionStatus, _end]joinString"";
private _typeText       = [_subCategoryTitle, "Type: ", _end, _subCategoryText,  (_self get "groupType"), _end]joinString"";
private _classText      = [_subCategoryTitle, "Class: ", _end, _subCategoryText, (_self get "squadClass"), _end]joinString"";
private _strengthText   = [_subCategoryTitle, "Strength: ", _end, _subCategoryText, _strength,"/",_strengthI, _end]joinString"";
private _abilityString  = call SQFM_fnc_groupDebugTextAbilities;
private _taskName       = _self get "taskData" get "name";
private _mechClearing   = _self getOrDefault ["mechClearing", false];
private _taskText       = "";
private _fleeText       = "";
private _reconText      = "";
private _battleTaskText = "";
private _mechText       = "";

if(!isNil "_taskName")then{ 
    _taskText = [_newLine,_green,_center,_mediumTxt,"(",_taskName,")",_enddd] joinString"";
};

if(_self get "reconDanger")
then{
    _reconText = [_newLine,_red,_center,_mediumTxt,"(Recon-DangerMode)",_enddd] joinString"";
};

if(_mechClearing)then{
    _mechText = [_newLine,_orange,_center,_mediumTxt,"(Mechanized-Clearing-Mode)",_enddd] joinString"";
};

if(!isNil "_battleTask")then{ 
    private _type = toUpper(_battleTask get "type");
    _taskText = [_newLine,_orange,_center,_mediumTxt,"(Battle task: ",_red,_type,_end,")",_enddd] joinString"";
};


if(fleeing _man)then{ 
    _fleeText = [_newLine,_red,_center,_mediumTxt,"(FLEEING)",_enddd] joinString"";
};

private _text = parseText 
([
    _outLine,
    _title,
    _taskText,
    _reconText,
    _mechText,
    _battleTaskText,
    _fleeText,
    _newLine, _actionText,
    _newLine, _stateText,
    _newLine, _idleText,
    _newLine, _statusText,
    _newLine, _typeText,
    _newLine, _classText,
    _newLine, _strengthText,
    _newLine,_abilityString,
    _newLine, _signature

] joinString "");

_text;