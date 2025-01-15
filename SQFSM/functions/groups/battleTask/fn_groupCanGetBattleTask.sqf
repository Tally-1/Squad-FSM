private _type          = _self get "groupType";
private _class         = _self get "squadClass";
private _excludedTypes = ["transport","recon"];
if(_type  in _excludedTypes)exitWith{false};
if(_class in _excludedTypes)exitWith{false};

private _hasAbility = _self get "allowBattleTask";
if(!_hasAbility)exitWith{false};

private _isPlayer = _self call ["isPlayerGroup"];
if(_isPlayer)exitWith{false};

private _state = _self get "state";
if("drop" in _state)exitWith{false};

private _valid = _self call ["isValid"];
if(!_valid)exitWith{false};

private _taskName    =  (_self call ["getTaskData"]) get "name";
private _hasTask     = !isNil "_taskName";
private _reinForcing = _hasTask&&{"refor" in _taskName&&{!("wait" in _taskName)}};
if(_reinForcing)exitWith{false};

true;