params[
    ["_groups",nil,[[]]]
];
if(time < 300)exitWith{};

private _positions = [];
{
    private _data = _x call getData;
    private _gPos = _data call ["initIdleGarrison",[_positions]];
    if(!isNil "_gPos")
    then{_positions pushBackUnique _gPos};

} forEach _groups;

true;