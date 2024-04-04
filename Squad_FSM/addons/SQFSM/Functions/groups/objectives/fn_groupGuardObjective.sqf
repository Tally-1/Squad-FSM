private _objectiveData = _self call ["objectiveData"];
private _objType       = _objectiveData get "type";
private _action        = ["Assigned to ", _objType] joinString"";
_self set ["action", _action];
_self set ["state", "Guarding objective"];

true;