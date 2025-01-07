params [
    ["_men",nil,[[]]]
];
private _ended = true;

{
    if(!(_x getVariable ["SQFM_Regrouped", true]))exitWith{_ended = false};
} forEach _men;

_ended;