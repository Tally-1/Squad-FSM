params[
    ["_movePos",     nil,      [[]]],
    ["_taskName",    "move",   [""]],
    ["_findParking", false, [false]]
];
private _grpPos         = _self call ["getAvgPos"];
private _distance       = _movePos distance2D _grpPos;
private _boardingStatus = _self call ["boardingStatus"];
private _travelNow      = _distance < SQFM_travelWalkDist || {_boardingStatus isEqualTo "boarded"};
private _params         = [_movePos, _taskName, _findParking];

// canUnloadInCombat  

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
private _canCallTransport = _self call ["canCallTransport"];
private _canWalk          = _self call ["canTravelOnFoot",[_movePos]];
if(!_canCallTransport)
exitWith{

    // If forced walk is enabled for the squad the move is executed.
    if(_canWalk)exitWith{
        private _message = ["Cannot call transport, forced walk to ", _taskName]joinString"";
        _message call dbgm;
        _self call ["execTravel", [_movePos, _taskName, false]];
        true;
    };

    private _message = ["Cannot call transport, ",_taskName," aborted."]joinString"";
    _message call dbgm;
    false;
};


// Transport is called, if denied the move is aborted.
private _transport = _self call ["callTransport", [_movePos]];
if(isNull _transport)
exitWith{

    // If forced walk is enabled for the squad the move is executed.
    if(_canWalk)exitWith{
        private _message = ["Transport denied, forced walk to ", _taskName]joinString"";
        _message call dbgm;
        _self call ["execTravel", [_movePos, _taskName, false]];
        true;
    };

    private _message = ["Transport denied, ",_taskName," aborted."]joinString"";
    _message call dbgm;
    false;
};

true;