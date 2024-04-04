if(_self call ["inBattle"])exitWith{0};

private _battles    = _self get "battleTimes";
if(_battles isEqualTo [])exitWith{3000};

private _prevBattle = _battles#(count _battles -1);
private _timeSince  = time - _prevBattle;

_timeSince;