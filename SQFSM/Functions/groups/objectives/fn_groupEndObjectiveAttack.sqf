_self spawn{
private _self         = _this;
private _group        = _self get "grp";
private _objModule    = _self get "objective";
private _objData      = _objModule call getData;
private _valid        = _self call ["isValid"];
private _groupPresent = (_self call ["isInsideObjective",[_objModule]]);
private _description  = _objData get "description";
private _message      = ["Attack on ", _description, " ended."]joinString"";

_self call ["deleteWaypoints"];
_self call ["unAssignObjective"];
_self set  ["action", ""];
_self set  ["state",  ""];

_message call dbgm;

if!(_valid)exitWith{"Squad was eliminated during assault" call dbgm};

if(_groupPresent)then{_self call ["autoAssignObjective",[]]}
else{
    (_objData get "zone")params["_pos","_rad"];
    _rad = _rad*0.5;
    
    _self set  ["action", "Moving into Objective"];

    private _noActionString = '(group this call getData) set  ["action", ""]; ';
    private _assignString   = '(group this call getData) call ["autoAssignObjective",[]];';
    private _onCompletion   = [_noActionString, _assignString] joinString"";
    private _wayPoint       = _group addWaypoint [_pos, 0];

    _wayPoint setWaypointCompletionRadius _rad;
    _wayPoint setWaypointStatements ["true", _onCompletion];

    
};

true;
};
true;