private _triggers  = _self get "triggers";

{
    private _pos    = getPosATLVisual _x;
    private _objPos = getPosATLVisual (_self get "module");
    private _active = triggerActivated _x;
    private _color  = [0.1,1,0.1,1];
    private _text   = "Trigger (active)";// typeOf _x;
    private _icon   = "\a3\Modules_f\data\iconSector_ca.paa";

    if!(_active)then{
        _color = [1,0,0,1];
        _text  = "Trigger (inactive)";
    };
    drawIcon3D[
        _icon,
        _color,
        _pos,
        1,
        1,
        0,
        _text,
        2,
        0.035
    ];
    _pos    set [2,3];
    _objPos set [2,3];
    drawLine3D [_pos,_objPos,_color];
} forEach _triggers;