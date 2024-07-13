private _tooSoon = time < (_self get "reinForTime");
if(_tooSoon)exitWith{};

private _sides = _self get "sides";
if(count _sides < 2)exitWith{};

{_self call ["reinforceSide", [_x]]} forEach _sides;

_self set ["reinForTime",round(time+9)];