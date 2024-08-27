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
private _xPos         = 0.5-(_width/2);
private _sqfmButton   = _display ctrlCreate ["RscButton",-1];

_sqfmButton ctrlSetPosition [_xPos, _yPos, _width, _height];
_sqfmButton ctrlCommit 0;
_sqfmButton ctrlSetFont "PuristaLight";
_sqfmButton ctrlSetText "SQUAD FSM";

_sqfmButton;