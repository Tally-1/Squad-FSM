params[
    ["_group",nil,[grpNull]]
];

private _data = _group call getData;
if(isNil "_data")exitWith{false};

private _vehicles = _data call ["getVehiclesInUse"];
if(_vehicles isEqualTo [])exitWith{false};

private _men = _data call ["getUnitsOnfoot"];
if(_men isEqualTo [])exitWith{false};

private _boarding = false;
{
    private _command = currentCommand _x;
    if(_command isEqualTo "GET IN")
    exitWith{_boarding = true};
    
} forEach _men;

_boarding;