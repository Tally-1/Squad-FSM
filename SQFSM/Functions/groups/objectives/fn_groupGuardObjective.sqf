private _group          = _self get "grp";
private _objectiveData  = _self call ["objectiveData"];
private _objType        = _objectiveData get "type";
private _action         = ["Assigned to ", _objType] joinString"";
private _postAction     = ["Garrisoned at ", _objType] joinString"";
private _vehicle        = vehicle formationLeader leader (_self get "grp");
private _squadPos       = _self call ["getAvgPos"];
private _coverPositions = (_objectiveData get "infCoverPositions")select{(_x distance2D _squadPos) < 100};
private _noPosAvailCode = {[_self, _postAction] spawn{(_this#0) call ["garrison", [_this#1, 150]]}};
private _manCount       = count(_self call ["getUnitsOnfoot"]);
private _posCount       = count _coverPositions;

_self call ["endMechClearing"];
_self set  ["action", _action];
_self set  ["state", "Guarding objective"];

_vehicle forceFollowRoad false;


if(_posCount < 4
&&{_manCount > 6})               exitWith _noPosAvailCode;
if(_coverPositions isEqualTo []) exitWith _noPosAvailCode;
if(_manCount < 2)                exitWith {};

"Group taking guard cover" call dbgm;

[_group, _coverPositions]spawn SQFM_fnc_groupGuardObjectiveTakeCover;

true;