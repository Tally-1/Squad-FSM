private _disabled = !(_self get "canGetTransport");
if(_disabled)exitWith{false};

private _onFoot = _self call ["boardingStatus"] isEqualTo "on foot";
if!(_onFoot)exitWith{false};

private _timeSinceLastCall = _self call ["sinceTransportCall"];
if(_timeSinceLastCall < 10)exitWith{false};

true;