private _orange    = [0.85,0.4,0,1];
private _green     = [0.3,1,0.3,1];
private _text      = "Battle";
private _icon      = "\a3\ui_f\data\igui\cfg\simpletasks\types\attack_ca.paa";
private _iconColor = _orange;
private _updtTime  = time - (_self get "updateTime");

if(_updtTime < 2)then{
    _text      = "Updated";
    _icon      = "\a3\ui_f\data\igui\cfg\simpletasks\types\move_ca.paa";
    _iconColor = _green;
};

drawIcon3D [
        _icon,
        _iconColor,
        (_self get "position"),
        1,
        1,
        0,
        _text,
        2,
        0.04
];

{drawLine3D _x}forEach(_self get "edgeLines");

if(!isNull (findDisplay 312))then{ 
	
    {
        if(_x distance2D camPos < 300)
        then{[_x] call SQFM_fnc_drawBuilding}
    } forEach (_self get "buildings");	
	
    {
        if(_x get "position" distance2D campos < 350)
        then{_x call ["drawLines"]};
    }forEach (_self get "urbanZones");
};

true;