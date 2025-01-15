private _status = _self get "status";
if(_status isEqualTo "winning")        exitWith{_self call ["initPush"]};
if(_status isEqualTo "even")           exitWith{_self call ["initFlank"]};
if(_status isEqualTo "loosing")        exitWith{_self call ["initHold"]};

true;