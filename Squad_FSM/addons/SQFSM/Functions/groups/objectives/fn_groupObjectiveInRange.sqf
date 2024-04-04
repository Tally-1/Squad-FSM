params[
	["_objectiveModule",nil,[objNull]]
];
private _objctvData = _objectiveModule getVariable "SQFM_objectiveData";
private _pos        = _self get"groupCluster"get"position";
private _range      = _objctvData get "range";
private _distance   = _pos distance2D _objectiveModule;
private _inRange    = _distance < _range;

_inRange;