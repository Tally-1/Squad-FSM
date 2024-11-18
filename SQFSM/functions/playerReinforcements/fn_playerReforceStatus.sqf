private _status      = "unknown";
private _group       = group player;
private _side        = side _group;
private _data        = _group call getData;
private _requestList = SQFM_reinforRequests get _side;
private _reqGroups   = _requestList apply {_x#1};
private _requestSent = _group in _reqGroups;
if(_requestSent)
exitWith{"Request sent, waiting for response"};

private _lastArrival = _data get "lastReforceArrival";
private _timeSince   = time -_lastArrival;
private _justArrived = _lastArrival > -1 &&{_timeSince <= 3};
if(_justArrived)
exitWith{"Arrived"};

private _incoming   = _data get "incomingReforce";
private _noReforce  = _incoming isEqualTo [];
private _notWaiting = !(_data get "awaitingReforce");
private _noArrival  = _lastArrival isEqualTo -1;
private _ended      = _notWaiting &&{_noArrival&&{_noReforce}};
if(_ended)     exitWith{"ended"};
if(_noReforce) exitWith{"No reinforcements"};

private _reforceGroup = _incoming#0;
private _reforceData  = _reforceGroup call getData;
private _inValid      = !(_reforceData call ["isValid"]);
if(_inValid)
exitWith{"Reinforcement group invalid"};


private _position = _reforceData call ["getAvgPos"];
private _distance = [player distance2D _position]call SQFM_fnc_describeDistance;
private _status   = ["On the way (",_distance,")"]joinString"";

_status;