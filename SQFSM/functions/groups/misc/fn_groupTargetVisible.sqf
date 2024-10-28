params[
    ["_target",nil,[objNull]]
];
private _visible  = false;
private _vehicles = _self call ["getGrpMembers"];

{
    private _validLOS = ([_x, "VIEW", _target] checkVisibility [(aimPos _x), (aimPos _target)])isEqualTo 1;
    if(_validLOS)
    exitWith{_visible = false};

} forEach _vehicles;

_visible;