private _justRequested = time - (_data get "lastReinfReq")<60;
if (_justRequested)           exitWith{false};
if (_data call ["inBattle"])  exitWith{false};
if!(_data get "canReinforce") exitWith{false};

true;