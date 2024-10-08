private _ctrl       = _self get "ctrl";
private _parentData = _self call ["getParentData"];
private _ctrlList   = _parentData get "controls";
private _index      = _ctrlList find _ctrl;

_ctrlList deleteAt _index;
ctrlDelete _ctrl;

true;