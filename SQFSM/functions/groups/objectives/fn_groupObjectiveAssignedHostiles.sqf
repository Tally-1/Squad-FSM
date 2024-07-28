params[
    ["_objective",nil,[objNull]]
];
private _side            = _self get "side";
private _objData         = _objective call getData;
private _hostileSides    = [east,west,independent] select {[_x,_side]call SQFM_fnc_hostile};
private _hostileStrength = 0;

{
    private _assets  = _objData call ["getAssignedAssets",[_x]];
    _hostileStrength = _hostileStrength+(_assets get "sum");
    
} forEach _hostileSides;

_hostileStrength;