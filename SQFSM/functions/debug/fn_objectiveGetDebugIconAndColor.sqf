private _color = _self get "3dColor";
private _icon  = _self get "defaultIcon";

if(_self get "contested")
exitWith{
    _icon  = _self get"contestedIcon";
    _color = [0.85,0.4,0,1];

    [_icon, _color];
};

if(_self call ["timeSinceCapture"] <= 2)
exitWith{
    _icon  = _self get "capturedIcon";
    _color = [0.3,1,0.3,1];

    [_icon, _color];
};

// If the objective is not active due to synched triggers.
if!(_self get "activated")
exitWith{
    _icon  = "\a3\Modules_f\data\iconSector_ca.paa";
    _color = [1,0,0,1];

    [_icon, _color];
};

[_icon, _color];