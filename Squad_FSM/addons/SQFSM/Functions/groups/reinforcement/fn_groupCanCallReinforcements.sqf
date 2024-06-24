private _prevCall   = _self get "lastReinfReq";
private _groupType  = _self get "groupType";
private _activeCall = _self get "awaitingReforce";

if(_groupType isEqualTo "transport")   exitWith{false;};
if(_activeCall)                        exitWith{false;};
if(time - _prevCall < 60)              exitWith{false;};
if!(_self get "canCallReinforcements") exitWith{false;};
if!(_self call ["isValid"])            exitWith{false;};

true;