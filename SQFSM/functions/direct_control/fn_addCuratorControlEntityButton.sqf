params[
    ["_display",nil,[displayNull]]
];
private _okButton     = _display displayCtrl 1;
private _cancelButton = _display displayCtrl 2;
private _okPos        = ctrlPosition _okButton;
private _cancelPos    = ctrlPosition _cancelButton;
private _yPos         = _okPos#1;
private _width        = _okPos#2;
private _height       = _okPos#3;
private _xPos         = (_cancelPos#0)+(_cancelPos#2)+0.01;// 0.5-(_width/2);
private _button       = _display ctrlCreate ["RscButton",-1];
private _frame        = _display ctrlCreate ["RscFrame",-1];
private _aqua         = [0.5,1,1,1];
private _diff         = _height*0.1;

_button ctrlSetPosition [_xPos, _yPos, _width, _height];
_button ctrlCommit 0;
_button ctrlSetFont "PuristaLight";
_button ctrlSetText "D-CONTROL";

_frame ctrlSetPosition [_xPos-_diff, _yPos-_diff, _width+(_diff*3), _height+(_diff*3)];
_frame ctrlSetTextColor _aqua;
_frame ctrlCommit 0;
_frame ctrlSetPosition [_xPos, _yPos, _width, _height];
_frame ctrlCommit 1;

_frame  ctrlAddEventHandler ["Committed", {(_this#0)spawn{sleep 0.3; _this ctrlShow false}}];
_button ctrlAddEventHandler [
    "ButtonClick", 
    {
        private _display = uiNamespace getVariable "SQFM_currentEditDisplay";
        _display closeDisplay 1;
        [SQFM_currentEditObject] call SQFM_fnc_switchUnit_Start;
        systemChat str SQFM_currentEditObject;
    }
];

_button;