params[
    ["_movePos",  nil,    [[]]],
    ["_taskName", "move", [""]]
];
private _grpPos         = _self call ["getAvgPos"];
private _distance       = _movePos distance2D _grpPos;
private _boardingStatus = _self call ["boardingStatus"];
private _travelNow      = _distance < 500 || {_boardingStatus isEqualTo "boarded"};
private _params         = [_movePos, _taskName];

// The group moves to its destination as is.
if(_travelNow)
exitWith{ 
	_self call ["execTravel", _params]; 
	true;
};

// The group Boards available vehicles, then moves to its destination.
if(_self call ["canBoardNow"]
&&{_self call ["boardThenTravel", _params]})
exitWith{true;};

// The group cannot call for transport, the move is aborted.
if!(_self call ["canCallTransport"])
exitWith{
    "Cannot call transport" call dbgm;
    false;
};

// Transport is called, if denied the move is aborted.
private _transport = _self call ["callTransport", [_movePos]];
if(isNull _transport)
exitWith{false;};

true;