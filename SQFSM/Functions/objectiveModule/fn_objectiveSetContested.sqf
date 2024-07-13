private _previousStatus = _self get  "contested";
private _currentStatus  = _self call ["getContested"];

if(_previousStatus isEqualTo _currentStatus)
exitWith{};

_self set ["contested", _currentStatus];
_self call ["globalize"];
true;