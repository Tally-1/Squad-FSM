#include "..\misc\textIncludes.sqf";
private _status     = call SQFM_fnc_playerReforceStatus;
private _type       = call SQFM_fnc_playerReforceType;
private _cancelText = ["<t color='#e8e7e7d8'>","[CTRL]+[F1] to cancel Reinforcements",_end]joinString"";
private _text = [
    _left,_green, "Reinforcement Status: ",_endd,_right,_status,_end,_newLine,
    _left,_green, "Reinforcement Type: ",_endd,_right,_type,_end,
    _newLine,_newLine,_center,_smallTxt,_cancelText
]joinString"";

[_status, _text];