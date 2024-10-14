sleep 0.1;
private _groupsSelected = count (curatorSelected#1);

if(_groupsSelected < 1)exitWith{};
if(_groupsSelected > 2)exitWith{};

private _group = curatorSelected#1#0;
private _data  = _group call getData;

if!(SQFM_debugMode) exitWith{};
if(isNil "_data")   exitWith{};

if(isServer)then{_data call ["update"]};

SQFM_group = _group;

private _debugText = _data call ["debugText"];

hint _debugText;
