params[
    ["_display",nil,[displayNull]]
];
private _strDisplay = str _display;
if!("#-1" in _strDisplay)exitWith{false};

private _okButton     = _display displayCtrl 1;
private _cancelButton = _display displayCtrl 2;
private _cancelText   = ctrlText _cancelButton;
private _okText       = ctrlText _okButton;

if(_cancelText isNotEqualTo "CANCEL") exitWith{false};
if(_okText     isNotEqualTo "OK")     exitWith{false};

private _fIndex = allControls _display findIf {"Rank:" in ctrlText _x};
if(_fIndex < 0)exitWith{false};

true;