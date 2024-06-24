private _group           = _self get "grp";
private _side            = _self get "side";
private _unit            = _self call ["anyValidMan"];
private _pos             = [(_self call ["getAvgPos"])] call SQFM_fnc_roundPos;
private _posName         = [_pos] call SQFM_fnc_areaName;
private _groupName       = str _group;
private _text            = ["We need reinforcements at ", _posName]joinString"";
private _commandResponse = [groupId _group, "! Request has been recieved, stand by for confirmation."]joinString"";
private _responseDelay   = 1+random 1;

[_unit, _text] remoteExecCall ["sideChat"];
[
    _side,
    _commandResponse,
    _responseDelay

] spawn SQFM_fnc_delayedBaseSideChat;
    
true;