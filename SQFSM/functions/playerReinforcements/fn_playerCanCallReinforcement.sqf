private _data          = group player call getData;
private _notLeader     = player != leader group player;
private _prevCall      = _data get "lastReinfReq";
private _groupType     = _data get "groupType";
private _transport     = _groupType isEqualTo "transport";
private _activeCall    = _data get "awaitingReforce";
private _earlyCall     = time - _prevCall < 60;
private _invalid       = !(_data call ["isValid"]);
private _noCbaOption   = !(_data get "canCallReinforcements");

if(_notLeader)   exitWith{"not_leader";};
if(_activeCall)  exitWith{"call_active";};
if(_earlyCall)   exitWith{"too_soon";};
if(_invalid)     exitWith{"invalid";};
if(_noCbaOption) exitWith{"no_cba_option";};

"ready";