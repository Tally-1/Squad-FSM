private _objectiveData = _self call ["objectiveData"];
private _objType       = _objectiveData get "type";
private _action        = ["Assigned to ", _objType] joinString"";
private _postAction    = ["Garrisoned at ", _objType] joinString"";
private _vehicle       = vehicle formationLeader leader (_self get "grp");

_self call ["endMechClearing"];

_self set  ["action", _action];
_self set  ["state", "Guarding objective"];
_vehicle forceFollowRoad false;

[_self, _postAction] spawn{(_this#0) call ["garrison", [_this#1, 150]]};

true;