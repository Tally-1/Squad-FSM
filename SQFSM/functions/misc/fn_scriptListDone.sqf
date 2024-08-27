params[
    ["_scriptArr",nil,[[]]]
];
private _completed = true;

{
    private _done = scriptDone _x;
    if((!isNil "_done")
    &&{!(_done)})
    exitWith{_completed = false};
    
} forEach _scriptArr;

_completed;