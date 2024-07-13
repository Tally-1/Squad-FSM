#include "..\..\misc\textIncludes.sqf";
private _groupName     = str (_self get "grp");
private _title         = [_bigTxt,_aqua, _groupName, _end,_end]joinString"";
private _action        = _self get "action";
private _strength      = _self call ["getStrength"];
private _strengthI     = _self get "initialStrength";
private _actionText    = "";
private _typeText      = [_subCategoryTitle, "Type: ", _end, _subCategoryText,  (_self get "groupType"), _end]joinString"";
private _classText     = [_subCategoryTitle, "Class: ", _end, _subCategoryText, (_self get "squadClass"), _end]joinString"";
private _strengthText  = [_subCategoryTitle, "Strength: ", _end, _subCategoryText, _strength,"/",_strengthI, _end]joinString"";
private _abilityString = call SQFM_fnc_groupDebugTextAbilities;


if(_action isNotEqualTo "")then{ 
    private _color = _green;
    if(_action isEqualTo "eliminated")
    then{_color = _red};
    _actionText = [_largeTxt,_color,"(",_action,")", _end,_end, _newLine]joinString"";
};

private _text = parseText 
([
    _outLine,
    _title,
    _newLine, _actionText,
    _newLine, _typeText,
    _newLine, _classText,
    _newLine, _strengthText,
    _newLine,_abilityString,
    _newLine, _signature

] joinString "");

_text;