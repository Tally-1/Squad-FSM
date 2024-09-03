private _hostileObj = false;
private _objectives = _self get "objectives";
private _side       = _self get "side";

{
    private _data      = _x call getData;
    private _owner     = _data get "owner";
    private _contested = _data get "contested";
    private _hostile   = _owner != _side;
    
    if(_contested) exitWith{systemChat "_C";_hostileObj = true};
    if(_hostile)   exitWith{systemChat "_H";_hostileObj = true}; 

} forEach _objectives;

// systemChat str ["hostile: ", _hostileObj];

_hostileObj;